from SCons.Script import *
import sconsutils
from sconsutils import deps
import os, shutil, glob

def is_version_above_or_equal(ver, maj, min, patch):
  M, m, p = map(lambda x: int(x), ver.split("."))
  if M < maj:
    return False
  elif M == maj:
    if m < min:
      return False
    elif m == min:
      if p < patch:
        return False
  return True

def make_arnold_plugin(env, **keywords):
  if not "arnold_ver" in keywords:
    raise Exception("Missing \"arnold_ver\" keyword argument")
  
  if not "app" in keywords:
    keywords["app"] = "arnold"
  
  if not "sources" in keywords:
    raise Exception("Missing \"sources\" keyword argument")
  
  name, subdir = env._make_any_pre(keywords)
  
  prefix = env.out_prefix()
  
  plug  = "%s/%s/%s/%s/%s" % (env.out_dir(), prefix, keywords["arnold_ver"], env.platform(), env.arch())
  plug += subdir + "/" + name
    
  env.ignore_import_lib()
  env['SHLIBPREFIX'] = ''
  if str(Platform()) == 'darwin':
    env['SHLINKFLAGS'] = '$LINKFLAGS -bundle'
  
  build_prefix = keywords.get("build_prefix", "arnold-%s" % keywords["arnold_ver"])
  if sys.platform == "win32":
    build_prefix += "/msvc-%s" % env.compiler_ver()
  env["OBJDIR"] = env.obj_dir() + "/" + build_prefix

  sconsutils.SetRPath(env, keywords)

  target = env.SharedLibrary(plug, env._collect_objects(keywords["sources"], sconsutils._shared_objects))
  
  keywords["build_files"] = {str(target[0]): "%s/%s/%s/%s" % (keywords["arnold_ver"], env.platform(), env.arch(), subdir)}
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


def require_arnold(env, ver=None):
  if ver is None:
    ver = "3.3.30"
  
  basepath = ARGUMENTS.get("arnoldroot", None)
  if not basepath:
    if env.platform() == "windows":
      basepath = "Z:/marza/team/rnd/tools/renderer/arnold"
    else:
      basepath = "/marza/team/rnd/tools/renderer/arnold"
    
    basepath += "/%s/all/%s/%s" % (ver, env.platform(), env.arch())
  
  if not os.path.exists(basepath):
    raise Exception("Invalid arnold specification")
  
  env.Append(CPPPATH=[basepath+"/include"])
  if is_version_above_or_equal(ver, 3, 3, 70) and env.platform() == "windows":
    # starting arnold 3.3.7.0, arnold libraries are in lib folder on windows
    env.Append(LIBPATH=[basepath+"/lib"])
  else:
    env.Append(LIBPATH=[basepath+"/bin"])
  env.Append(LIBS=["ai"])


def configure_ext(env, deps_dir):
  
  class new(env.__class__):
    pass
  setattr(new, "make_arnold_plugin", make_arnold_plugin)
  setattr(new, "require_arnold", require_arnold)
  env.__class__ = new
  

