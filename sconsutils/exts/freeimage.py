from SCons.Script import *
from sconsutils import deps
import os.path

def require_freeimage_base(env, ver=None):
  if env.platform() in ["windows", "linux"]:
    outdir = ARGUMENTS.get('dependency-dir')
    repdir = "/marza/team/rnd/libs"
    if env.platform() == "windows":
      repdir = "z:" + repdir
    check  = outdir+"/include/FreeImage.h"
    if not os.path.exists(check):
      deps.fetch(repdir, outdir, ["freeimage-%s" % ver if ver else "freeimage"])
    env.Append(CPPPATH = [env.deps_dir()+"/include"])
  elif env.platform() == "osx":
    env.Append(CPPPATH = ["/opt/local/include"])
    env.Append(LIBPATH = ["/opt/local/lib"])

def require_freeimage(env, ver=None):
  require_freeimage_base(env, ver)
  env.Append(LIBS = env['FREEIMAGE_LIBS'])


def require_freeimage_static(env, ver=None):
  require_freeimage_base(env, ver)
  env.Append(CPPDEFINES = ['FREEIMAGE_LIB'])
  env.Append(LIBS = env['FREEIMAGE_S_LIBS']) 

def configure_ext(env, deps_dir):
  
  if env.platform() == "windows":
    dll_name = "FreeImage"
    lib_name = "FreeImage_s"
    if env.compiler_ver() >= 9.0:
      dll_name += "-vc90"
      lib_name += "-vc90"
    elif env.compiler_ver() >= 8.0:
      dll_name += "-vc80"
      lib_name += "-vc80"
  else:
    dll_name = "freeimage"
    lib_name = "freeimage_s"
  
  env['FREEIMAGE_LIBS']   = [dll_name]
  env['FREEIMAGE_S_LIBS'] = [lib_name]
    
  
  class new(env.__class__):
    pass
  setattr(new, "require_freeimage", require_freeimage)
  setattr(new, "require_freeimage_static", require_freeimage_static)
  env.__class__ = new
