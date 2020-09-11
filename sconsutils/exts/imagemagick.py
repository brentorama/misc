from SCons.Script import *
from sconsutils import deps
import os.path

def require_imagemagick(env, ver=None, **kwargs):
  if env.platform() == "windows":
    outdir = ARGUMENTS.get('dependency-dir')
    repdir = "z:/marza/team/rnd/libs"
    check = outdir+"/include/magick/MagickCore.h"
    if not os.path.exists(check):
      deps.fetch(repdir, outdir, ["ImageMagick-%s" % ver if ver else "ImageMagick"])
  
  env.Append(CPPDEFINES = env["IMAGEMAGICK_CPPDEFINES"])
  env.Append(CPPPATH = env["IMAGEMAGICK_CPPPATH"])
  env.Append(LIBPATH = env["IMAGEMAGICK_LIBPATH"])
  env.Append(LIBS = env["IMAGEMAGICK_LIBS"])

def configure_ext(env, deps_dir):
  
  if env.platform() == "windows":
    env["IMAGEMAGICK_CPPDEFINES"] = ["_MAGICKDLL_"]
    env["IMAGEMAGICK_CPPPATH"] = [deps_dir+"/include"]
    env["IMAGEMAGICK_LIBPATH"] = []
    env["IMAGEMAGICK_LIBS"] = ["CORE_RL_magick_", "CORE_RL_Magick++_", "CORE_RL_wand_"]
  elif env.platform() == "osx":
    env["IMAGEMAGICK_CPPDEFINES"] = []
    env["IMAGEMAGICK_CPPPATH"] = ["/opt/local/include"]
    env["IMAGEMAGICK_LIBPATH"] = ["/opt/local/lib"]
    env["IMAGEMAGICK_LIBS"] = []
  else:
    env["IMAGEMAGICK_CPPDEFINES"] = []
    env["IMAGEMAGICK_CPPPATH"] = []
    env["IMAGEMAGICK_LIBPATH"] = []
    env["IMAGEMAGICK_LIBS"] = []
  
  class new(env.__class__):
    pass
  setattr(new, "require_imagemagick", require_imagemagick)
  env.__class__ = new
