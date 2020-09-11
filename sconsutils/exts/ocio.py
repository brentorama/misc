from SCons.Script import *
from sconsutils import deps
import os.path

def require_ocio(env, ver=None):
  outdir = ARGUMENTS.get('dependency-dir')
  repdir = "/marza/team/rnd/libs"
  if env.platform() == "windows":
    repdir = "z:" + repdir
  checkpath = "/include/OpenColorIO/OpenColorIO.h"
  
  check = outdir+checkpath
  if not os.path.exists(check):
    deps.fetch(repdir, outdir, ["ocio-%s" % ver if ver else "ocio"])
  
  env.Append(CPPDEFINES = env['OCIO_CPPDEFINES'])
  env.Append(CPPPATH    = env['OCIO_CPPPATH'])
  env.Append(LIBS       = env['OCIO_LIBS'])

def configure_ext(env, deps_dir):
  
  if env.platform() == "windows":
    env['OCIO_CPPDEFINES'] = ['OpenColorIO_STATIC']
    env['OCIO_CPPPATH']    = [deps_dir+'/include/windows']
    env['OCIO_LIBS']       = ['OpenColorIO', 'tinyxml', 'libyaml-cppmd']
  else:
    env['OCIO_CPPDEFINES'] = []
    env['OCIO_CPPPATH']    = [deps_dir+'/include/unix']
    env['OCIO_LIBS']       = ['OpenColorIO', 'tinyxml', 'yaml-cpp']
  
  class new(env.__class__):
    pass
  setattr(new, "require_ocio", require_ocio)
  env.__class__ = new



