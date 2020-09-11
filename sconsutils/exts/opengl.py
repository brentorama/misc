from SCons.Script import *
from sconsutils import deps
import os.path

def require_opengl(env):
  if env.platform() == "windows":
    outdir = ARGUMENTS.get('dependency-dir')
    repdir = "z:/marza/team/rnd/libs"
    check = outdir+"/include/GL/glext.h"
    if not os.path.exists(check):
      deps.fetch(repdir, outdir, ["glext"])
    env.Append(CPPPATH = [env.deps_dir()+"/include"])

  env.Append(LINKFLAGS = env['GL_LINKFLAGS'])
  env.Append(LIBS      = env['GL_LIBS'])

def configure_ext(env, deps_dir):
  if env.platform() == "osx":
    env['GL_LINKFLAGS'] = ' -framework OpenGL'
    env['GL_LIBS'] = []
  elif env.platform() == "windows":
    env['GL_LINKFLAGS'] = ''
    env['GL_LIBS'] = ['glu32', 'opengl32']
  else:
    env['GL_LINKFLAGS'] = ''
    env['GL_LIBS'] = ['GLU', 'GL']
  
  class new(env.__class__):
    pass
  setattr(new, "require_opengl", require_opengl)
  env.__class__ = new
