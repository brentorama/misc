from SCons.Script import *
from sconsutils import deps
import os.path

def require_fbx_base(env, ver):
  if env.platform() == "windows":
    outdir = ARGUMENTS.get('dependency-dir')
    repdir = "/marza/team/rnd/libs"
    if env.platform() == "windows":
      repdir = "z:" + repdir
    check  = outdir+"/include/fbxsdk.h"
    if not os.path.exists(check):
      deps.fetch(repdir, outdir, ["fbx-%s" % ver if ver else "fbx"])
    env.Append(CPPPATH = [env.deps_dir()+"/include"])
    env.Append(LIBPATH = [env.deps_dir()+"/lib"])
    return True
  else:
    return False

def require_fbx(env, ver=None):
  if require_fbx_base(env, ver):
    env.Append(LIBS = ["libfbxsdk"])

def require_fbx_static(env, ver=None):
  if require_fbx_base(env, ver):
    env.Append(LIBS = ["libfbxsdk-md"])

def configure_ext(env, deps_dir):
  class new(env.__class__):
    pass
  setattr(new, "require_fbx", require_fbx)
  setattr(new, "require_fbx_static", require_fbx_static)
  env.__class__ = new
