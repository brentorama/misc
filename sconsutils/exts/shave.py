from SCons.Script import *
import sconsutils
import os, glob, re

def get_shave_basepath(env):
  basepath = "/marza/team/rnd/tools/maya/Shave/"
  if env.platform() == "windows":
    basepath = "z:" + basepath
  return basepath

def list_shave_versions(env):
  vers = set()
  basepath = get_shave_basepath(env)
  for item in glob.glob(basepath+"*"):
    vers.add(item.replace("\\", "/").replace(basepath, ""))
  vers = filter(lambda x: re.match(r"^\d+\.\d+\.\d+$", x), list(vers))
  vers.sort()
  return vers

def require_shave(env, ver=None, mayaver=None):
  vers = list_shave_versions(env)
  if len(vers) == 0:
    raise Exception("No shave installed")
  
  if ver is None:
    ver = vers[-1]
  elif not ver in vers:
    raise Exception("Invalid shave version \"%s\" (installed versions %s)" % (ver, vers))
  
  if mayaver is None:
    raise Exception("Maya version not set")
  
  shavepath = "%s%s/%s/%s/%s" % (get_shave_basepath(env), ver, mayaver, env.platform(), env.arch())
  
  if not os.path.isdir(shavepath):
    raise Exception("No shave %s for maya %s" % (ver, mayaver))
  
  env.Append(CPPPATH = [shavepath + "/include"])
  env.Append(LIBPATH = [shavepath + "/lib"])
  if env.platform() == "windows":
    env.Append(LIBS = ["libShaveAPI"])
  else:
    env.Append(LIBS = ["ShaveAPI"])

def configure_ext(env, deps_dir):
  class new(env.__class__):
    pass
  setattr(new, "require_shave", require_shave)
  env.__class__ = new
