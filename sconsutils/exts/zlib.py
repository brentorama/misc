from SCons.Script import *
from sconsutils import deps
import os.path

def require_zlib(env, ver=None):
  
  if env.platform() == "windows":
    outdir = ARGUMENTS.get('dependency-dir')
    repdir = "z:/marza/team/rnd/libs"
    check = outdir+"/include/zlib.h"
    
    if not os.path.exists(check):
      deps.fetch(repdir, outdir, ["zlib-%s" % ver if ver else "zlib"])
    
    env.Append(CPPPATH = [outdir+"/include"])
    if int(ARGUMENTS.get("static", "1")) == 1:
      env.Append(LIBS = ["zlib"])
    else:
      env.Append(CPPDEFINES = ["ZLIB_DLL"])
      env.Append(LIBS = ["zdll"])
  
  else:
    env.Append(LIBS = ["z"])

def configure_ext(env, deps_dir):
  
  class new(env.__class__):
    pass
  setattr(new, "require_zlib", require_zlib)
  env.__class__ = new

