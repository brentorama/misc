from SCons.Script import *
import sconsutils
from sconsutils import deps
import os, shutil, glob

def get_nuke_plugin_ext(env):
  if env.platform() == "windows":
    return ".dll"
  elif env.platform() == "osx":
    return ".dylib"
  else:
    return ".so"

def get_nuke_basepath(env):
  vers = set()
  if env.platform() == "windows":
    if env.arch() == "x64":
      return "C:/Program Files/Nuke"
    else:
      return "C:/Program Files (x86)/Nuke"
  elif env.platform() == "osx":
    return "/Applications/Nuke"
  else:
    return "/usr/local/Nuke"

def list_nuke_versions(env):
  vers = set()
  basepath = get_nuke_basepath(env)
  for item in glob.glob(basepath+"*"):
    vers.add(item.replace("\\", "/").replace(basepath, ""))
  vers = list(vers)
  vers.sort()
  return vers

def make_nuke_plugin(env, **keywords):
  if not "nuke_ver" in keywords:
    raise Exception("Missing \"nuke_ver\" keyword argument")
  
  if not "app" in keywords:
    keywords["app"] = "nuke"
  
  if not "sources" in keywords:
    raise Exception("Missing \"sources\" keyword argument")
  
  name, subdir = env._make_any_pre(keywords)
  
  prefix = env.out_prefix()
  
  plug  = "%s/%s/%s/%s/%s" % (env.out_dir(), prefix, keywords["nuke_ver"], env.platform(), env.arch())
  plug += subdir + "/" + name
    
  env.ignore_import_lib()
  env['SHLIBPREFIX'] = ''
  env['SHLIBSUFFIX'] = get_nuke_plugin_ext(env)
  if str(Platform()) == 'darwin':
    env['SHLINKFLAGS'] = '$LINKFLAGS -bundle'
  
  build_prefix = keywords.get("build_prefix", "nuke-%s" % keywords["nuke_ver"])
  if sys.platform == "win32":
    build_prefix += "/msvc-%s" % env.compiler_ver()
  env["OBJDIR"] = env.obj_dir() + "/" + build_prefix

  sconsutils.SetRPath(env, keywords)

  target = env.SharedLibrary(plug, env._collect_objects(keywords["sources"], sconsutils._shared_objects))
  
  keywords["build_files"] = {str(target[0]): "%s/%s/%s/%s" % (keywords["nuke_ver"], env.platform(), env.arch(), subdir)}
  if env.generates_manifest() and env.keep_manifest():
    keywords["build_files"][str(target[0])+".manifest"] = keywords["build_files"][str(target[0])]
  
  env._make_any_post(target, keywords)
  
  # extra cleanup MSVC shit !
  if env.platform() == "windows":
    if env.generates_manifest() and not env.keep_manifest():
      manifest = (str(target[0])+'.manifest').replace("/", "\\")
      env.AddPostAction(target, "del /Q \"%s\"" % manifest)
    if env.build_debug():
      Clean(target, plug+'.ilk')
  else:
    env.Append(CCFLAGS = ["-fvisibility=hidden"])
  
  return target


def require_nuke(env, ver=None):
  vers = list_nuke_versions(env)
  if len(vers) == 0:
    raise Exception("No nuke installed")
  if ver is None:
    ver = vers[-1]
  elif not ver in vers:
    raise Exception("Invalid nuke version \"%s\" (installed versions %s)" % (ver, vers))
  
  nukepath = get_nuke_basepath(env) + ver
  
  if env.platform() == "windows":
    env.Append(CPPDEFINES = ["NOMINMAX"])
    env.Append(LIBS = ["glew32"])
  else:
    env.Append(LIBS = ["GLEW"])
    env.Append(CCFLAGS = " -Wno-unused-variable -Wno-unused-parameter")
    if env.platform() == "osx":
      nukepath += "/Nuke%s.app/Contents/MacOS" % ver
  
  incpath = nukepath + "/include"
  libpath = nukepath
  
  env.Append(CPPDEFINES = ["USE_GLEW"])
  env.Append(CPPPATH = [incpath])
  env.Append(LIBPATH = [libpath])
  env.Append(LIBS = ["DDImage"])

def configure_ext(env, deps_dir):
  
  class new(env.__class__):
    pass
  setattr(new, "make_nuke_plugin", make_nuke_plugin)
  setattr(new, "require_nuke", require_nuke)
  env.__class__ = new
  

