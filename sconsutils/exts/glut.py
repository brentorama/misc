from SCons.Script import *
from sconsutils import deps
import os.path

def require_glut(env):
  if env.platform() == "windows":
    outdir = ARGUMENTS.get('dependency-dir')
    repdir = "z:/marza/team/rnd/libs"
    check = outdir+"/include/GL/glut.h"
    if not os.path.exists(check):
      deps.fetch(repdir, outdir, ["glut"])
  
  env.Append(CPPPATH    = env['GLUT_CPPPATH'])
  env.Append(CPPDEFINES = env['GLUT_CPPDEFINES'])
  env.Append(LINKFLAGS  = env['GLUT_LINKFLAGS'])
  env.Append(LIBS       = env['GLUT_LIBS'])

def configure_ext(env, deps_dir):
  if env.platform() == "osx":
    env['GLUT_CPPPATH'] = []
    env['GLUT_CPPDEFINES'] = ['']
    env['GLUT_LINKFLAGS'] = ' -framework GLUT -framework OpenGL'
    env['GLUT_LIBS'] = []
  elif env.platform() == "windows":
    env['GLUT_CPPPATH'] = [deps_dir+"/include"]
    env['GLUT_CPPDEFINES'] = ["GLUT_NO_LIB_PRAGMA"]
    if env.build_64():
      env['GLUT_LINKFLAGS'] = ''
      env['GLUT_LIBS'] = ['glut64', 'glu32', 'opengl32']
    else:
      env['GLUT_LINKFLAGS'] = ''
      env['GLUT_LIBS'] = ['glut32', 'glu32', 'opengl32']
  else:
    env['GLUT_CPPPATH'] = []
    env['GLUT_CPPDEFINES'] = ['']
    env['GLUT_LINKFLAGS'] = ''
    env['GLUT_LIBS'] = ['glut', 'GLU', 'GL']
  
  class new(env.__class__):
    pass
  setattr(new, "require_glut", require_glut)
  env.__class__ = new
