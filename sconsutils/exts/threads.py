from SCons.Script import *
from sconsutils import deps
import os.path

def require_threads(env):
  env.Append(CCFLAGS   = env['THREADS_CCFLAGS'])
  env.Append(LINKFLAGS = env['THREADS_LINKFLAGS'])
  env.Append(LIBS      = env['THREADS_LIBS'])

def configure_ext(env, deps_dir):
  if env.platform() == "osx":
    env['THREADS_CCFLAGS'] = []
    env['THREADS_LINKFLAGS'] = ' -framework CoreServices'
    env['THREADS_LIBS'] = ['pthread']
  elif env.platform() == "windows":
    env['THREADS_CCFLAGS'] = []
    env['THREADS_LINKFLAGS'] = ''
    env['THREADS_LIBS'] = []
  else:
    env['THREADS_CCFLAGS'] = ['-fPIC']
    env['THREADS_LINKFLAGS'] = ''
    env['THREADS_LIBS'] = ['pthread']
  
  class new(env.__class__):
    pass
  setattr(new, "require_threads", require_threads)
  env.__class__ = new
