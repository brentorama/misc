from SCons.Script import *
import sconsutils
from sconsutils import deps
import os, shutil, glob


def make_ofx_plugin(env, **keywords):
  if not "app" in keywords:
    keywords["app"] = "openfx"
  
  if not "sources" in keywords:
    raise Exception("Missing \"sources\" keyword argument")
  
  name, subdir = env._make_any_pre(keywords)
  
  prefix = env.out_prefix()
  
  # platform and arch are handled by the OpenFX bundle directory layout
  plug  = "%s/%s/all" % (env.out_dir(), prefix)
  plug += subdir
  
  contents_path = name + ".ofx.bundle/Contents"
  res_path = contents_path + "/Resources"
  
  res_stage_path = "all/" + res_path
  contents_stage_path = "all/" + contents_path
  
  if not "install_files" in keywords:
    keywords["install_files"] = {}
  
  if "ofx_icons" in keywords:
    for pattern in keywords["ofx_icons"]:
      for iconpath in glob.glob(pattern):
        keywords["install_files"][iconpath] = res_stage_path
  
  if "ofx_res" in keywords:
    for pattern in keywords["ofx_res"]:
      for respath in glob.glob(pattern):
        keywords["install_files"][respath] = res_stage_path
  
  if env.platform() == "osx":
    plist = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>CFBundleDevelopmentRegion</key>
  <string>English</string>
  <key>CFBundleExecutable</key>
  <string>%s</string>
  <key>CFBundleInfoDictionaryVersion</key>
  <string>6.0</string>
  <key>CFBundlePackageType</key>
  <string>BNDL</string>
  <key>CFBundleVersion</key>
  <string>1.0</string>
</dict>
</plist>
""" % (name+".ofx")
    # Might want to find a better solution for this temporary file
    # -> what if we build several Ofx plugin with the same SConstruct?
    plist_path = "Info.plist"
    plist_file = open(plist_path, "w")
    plist_file.write(plist)
    plist_file.close()
    keywords["install_files"][plist_path] = contents_stage_path
    archdir = "MacOS"
    env['SHLINKFLAGS'] = '$LINKFLAGS -bundle'
  
  elif env.platform() == "windows":
    archdir = ("Win64" if env.arch() == "x64" else "Win32")
    
  elif env.platform() == "linux":
    archdir = ("Linux-x86-64" if env.arch() == "x64" else "Linux-x86")
  
  else:
    raise Exception("Unknown platform \"%s\"" % env.platform())
  
  plug += "/" + contents_path + "/" + archdir + "/" + name
  deploy_target = "all/"+subdir+"/"+contents_path+"/"+archdir
  
  env.ignore_import_lib()
  env['SHLIBPREFIX'] = ''
  env['SHLIBSUFFIX'] = env['OFX_MOD_SUFFIX']
  
  build_prefix = keywords.get("build_prefix", "openfx-%s" % env["OPENFX_VERSION"])
  if sys.platform == "win32":
    build_prefix += "/msvc-%s" % env.compiler_ver()
  env["OBJDIR"] = env.obj_dir() + "/" + build_prefix

  sconsutils.SetRPath(env, keywords)

  target = env.SharedLibrary(plug, env._collect_objects(keywords["sources"], sconsutils._shared_objects))
  
  keywords["build_files"] = {str(target[0]): deploy_target}
  if env.generates_manifest() and env.keep_manifest():
    keywords["build_files"][str(target[0])+".manifest"] = keywords["build_files"][str(target[0])]
  # don't forget install_files for resources
  
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
    if env.platform() == "osx":
      Clean(target, "Info.plist")
  
  return target


def require_ofx(env, ver=None):
  if env.platform() == "windows":
    outdir = ARGUMENTS.get('dependency-dir')
    repdir = "z:/marza/team/rnd/libs"
    check  = outdir+"/include/ofxCore.h"
    if not os.path.exists(check):
      pkg = ("openfx-%s" % ver) if ver is not None else "openfx"
      deps.fetch(repdir, outdir, [pkg])
  env.ignore_import_lib()
  env["OPENFX_VERSION"] = ("" if ver is None else str(ver))
  env['SHLIBPREFIX'] = ''
  env['SHLIBSUFFIX'] = env['OFX_MOD_SUFFIX']
  if str(Platform()) == 'darwin':
    env['SHLINKFLAGS'] = '$LINKFLAGS -bundle'
  #env.Append(CPPPATH = env['OFX_CPPPATH'])


def configure_ext(env, deps_dir):
  
  #env['OFX_CPPPATH'] = []
  env['OFX_MOD_SUFFIX'] = '.ofx'
  
  class new(env.__class__):
    pass
  setattr(new, "make_ofx_plugin", make_ofx_plugin)
  setattr(new, "require_ofx", require_ofx)
  env.__class__ = new
