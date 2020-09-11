from SCons.Script import *
from sconsutils import deps
import os.path

def require_expat(env, ver=None):
  outdir = ARGUMENTS.get('dependency-dir')
  if env.platform() == "windows":
    repdir = "z:/marza/team/rnd/libs"
    check = outdir+"/include/expat/expat.h"
    if not os.path.exists(check):
      deps.fetch(repdir, outdir, ["expat-%s" % ver if ver else "expat"])
  
  env.Append(CPPPATH = env['EXPAT_CPPPATH'])
  env.Append(LIBS    = env['EXPAT_LIBS'])

def configure_ext(env, deps_dir):
  
  if env.platform() == "windows":
    env['EXPAT_CPPPATH'] = [deps_dir+'/include/expat']
  else:
    env['EXPAT_CPPPATH'] = []
  env['EXPAT_LIBS']    = ['expat']
  
  class new(env.__class__):
    pass
  setattr(new, "require_expat", require_expat)
  env.__class__ = new

