from SCons.Script import *
import subprocess
import sconsutils
import glob
import re
import os

_hou_mscver = {"13.0": "9.0",
               "14.0": "11.0",
               "15.0": "11.0",
               "15.5": "14.0",
               "16.0": "14.0",
               "16.5": "14.0",
               "17.0": "14.1"}

_hou_gccver = {"17.0": "/opt/rh/devtoolset-6/root"}

def setup_mscver(houver):
  if sys.platform == "win32":
    mscver = ARGUMENTS.get("mscver", None)
    if mscver is None:
      mscver = _hou_mscver.get(houver, None)
      if mscver is not None:
        print("Using msvc %s" % mscver)
        ARGUMENTS["mscver"] = mscver

def setup_gccver(houver):
  if sys.platform.startswith("linux"):
    gccroot = ARGUMENTS.get("gcc-root", None)
    if gccroot is None:
      gccroot = _hou_gccver.get(houver, None)
      if gccroot is not None:
        print("Using gcc from %s" % gccroot)
        ARGUMENTS["gcc-root"] = gccroot

def _setup_houdini_env(env, keywords):
  if not "app" in keywords:
    keywords["app"] = "houdini"
  
  if not "sources" in keywords:
    raise Exception("Missing \"sources\" keyword argument")
  
  hsiteDir = False
  if "hsite" in keywords and keywords["hsite"]:
    hsiteDir = True
  
  ver = keywords["houdini_ver"]
  # sometimes houdini version has 4 digits, strip last one
  ver = ".".join(ver.split(".")[:3])
  
  name, subdir = env._make_any_pre(keywords)
  
  prefix = env.out_prefix()
  
  env['SHLIBPREFIX'] = env['HOUDINI_SHLIBPREFIX']
  env['SHLIBSUFFIX'] = env['HOUDINI_SHLIBSUFFIX']
  env.ignore_import_lib()
  if env.platform() == "osx":
    env['SHLINKFLAGS'] = '$LINKFLAGS -bundle -flat_namespace'
  
  if hsiteDir:
    dll = "%s/%s/%s/%s/%s/dso" % (env.out_dir(), prefix, ver, env.platform(), env.arch())
  else:
    dll = "%s/%s/%s/dso/%s/%s" % (env.out_dir(), prefix, ver, env.platform(), env.arch())
  
  dll += subdir + "/" + name
  
  build_prefix = keywords.get("build_prefix", "houdini-%s" % ver)
  if sys.platform == "win32":
    build_prefix += "/msvc-%s" % env.compiler_ver()
  env["OBJDIR"] = env.obj_dir() + "/" + build_prefix

  sconsutils.SetRPath(env, keywords)

  target = env.SharedLibrary(dll, env._collect_objects(keywords["sources"], sconsutils._shared_objects))
  
  if hsiteDir:
    keywords["build_files"] = {str(target[0]): "%s/%s/%s/dso/%s" % (ver, env.platform(), env.arch(), subdir)}
  else:
    keywords["build_files"] = {str(target[0]): "%s/dso/%s/%s/%s" % (ver, env.platform(), env.arch(), subdir)}
  if env.generates_manifest() and env.keep_manifest():
    keywords["build_files"][str(target[0])+".manifest"] = keywords["build_files"][str(target[0])]
  
  env._make_any_post(target, keywords)
  
  # extra cleanup MSVC shit !
  if env.platform() == "windows":
    if env.generates_manifest() and not env.keep_manifest():
      manifest = (str(target[0])+".manifest").replace("/", "\\")
      env.AddPostAction(target, "del /Q \"%s\"" % manifest)
    if env.build_debug():
      Clean(target, dll+'.ilk')
  else:
    env.Append(CCFLAGS = ["-fvisibility=hidden"])
  
  return target


def require_houdini(env, ver):
  get_builds(env, ("x64" if env.build_64() else "x86"))
  
  ndver = ver.replace(".", "")
  arch = "_64" if env.build_64() else ""
  houdinipath = env['HOUDINI_'+ndver+arch+'_BASE']

  # call hcustom -c, hcustom -m !
  hcustomenv = os.environ.copy()
  if env.platform() == "osx":
    env.Append(LIBPATH=[houdinipath + "/Libraries"])
    houdinipath += "/Resources"
  elif env.platform() == "linux":
    env.Append(LIBPATH=[houdinipath + "/dsolib"])
  hcustomenv["HFS"] = houdinipath
  if env.platform() == "windows":
    # Oldver version of hcustom on windows require MSVCDir to be set
    cmntools = "VS%sCOMNTOOLS" % str(env.compiler_ver()).replace(".", "")
    if cmntools in hcustomenv:
      cmntools = hcustomenv[cmntools]
      if cmntools.endswith("\\") or cmntools.endswith("/"):
        cmntools = cmntools[:-1]
      cmntools = os.path.join(os.path.split(os.path.split(cmntools)[0])[0], "VC")
      hcustomenv["MSVCDir"] = cmntools
  
  cmd = "\"%s/bin/hcustom\" -c" % houdinipath
  p = subprocess.Popen(cmd, shell=True, env=hcustomenv, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
  out, err = p.communicate()
  ccflags = out.strip()
  if not "DLLEXPORT" in ccflags:
    if env.platform() == "windows":
      ccflags += ' /DDLLEXPORT="__declspec(dllexport)"'
    else:
      ccflags += ' -DDLLEXPORT='
  if env.platform() == "linux":
    if int(ver.split(".")[0]) >= 14:
      if not "-std=c++11" in ccflags and not "-std=c++14" in ccflags:
        ccflags += ' -DBOOST_NO_DEFAULTED_FUNCTIONS -DBOOST_NO_DELETED_FUNCTIONS'
  
  cmd = "\"%s/bin/hcustom\" -m" % houdinipath
  p = subprocess.Popen(cmd, shell=True, env=hcustomenv, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
  out, err = p.communicate()
  linkflags = out.strip()
  if env.platform() == "windows":
    linkflags = re.sub(r"-link\s+", "", linkflags)
  #elif env.platform() == "osx":
  else:
    env.Append(LIBS=["HoudiniOP1", "HoudiniOP2", "HoudiniOP3", "HoudiniOPZ", "HoudiniGEO", "HoudiniPRM", "HoudiniSIM", "HoudiniUI", "HoudiniUT"])
    
  env.Append(CCFLAGS=" %s" % ccflags)
  env.Append(LINKFLAGS=" %s" % linkflags)


def make_houdini_plugin(env, **keywords):
  if not "houdini_ver" in keywords:
    raise Exception("Missing \"houdini_ver\" keyword argument")
  env.require_houdini(keywords["houdini_ver"])
  env.Append(CPPDEFINES=["MAKING_DSO"])
  return _setup_houdini_env(env, keywords)


def get_builds(env, arch="x64"):
  if env.platform() == "windows":
    basepath = "C:/Program Files"
    if arch != "x64":
      basepath += " (x86)"
    basepath += "/Side Effects Software/Houdini "
  elif env.platform() == "osx":
    basepath = "/Library/Frameworks/Houdini.framework/Versions/"
  else:
    basepath = "/opt/hfs"
  
  verexp = re.compile(r"(\d+\.\d+\.\d+(\.\d+)?)$")
  
  pl = map(lambda x: verexp.search(x.replace("\\", "/")), glob.glob("%s*" % basepath))
  pl = filter(lambda x: x!=None, pl)
  bl = map(lambda x: x.group(1), pl)
  
  for b in bl:
    key = "HOUDINI_" + b.replace(".", "")
    if arch == "x64":
      key += "_64"
    key += "_BASE"
    env[key] = "%s%s" % (basepath, b)
  


def configure_ext(env, deps_dir):
  
  
  if env.platform() == "windows":
    env['HOUDINI_SHLIBPREFIX'] = ''
    env['HOUDINI_SHLIBSUFFIX'] = '.dll'
  elif env.platform() == "linux":
    env['HOUDINI_SHLIBPREFIX'] = ''
    env['HOUDINI_SHLIBSUFFIX'] = '.so'
  elif env.platform() == "osx":
    env['HOUDINI_SHLIBPREFIX'] = ''
    env['HOUDINI_SHLIBSUFFIX'] = '.dylib'
  else:
    raise Exception("Platform not supported: %s" % env.platform())
  
  class new(env.__class__):
    pass
  setattr(new, "require_houdini", require_houdini)
  setattr(new, "make_houdini_plugin", make_houdini_plugin)
  env.__class__ = new
