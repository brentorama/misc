from SCons.Script import *
from sconsutils import deps
import os.path

# need zlib and openexr dependency packages

def require_openexr(env, ver=None, **keywords):

  env.Append(CPPPATH = env['OPENEXR_CPPPATH'])
  env.Append(LIBPATH = env['OPENEXR_LIBPATH'])
  
  if env.platform() == "windows":
    outdir = ARGUMENTS.get('dependency-dir')
    repdir = "z:/marza/team/rnd/libs"
  
    check = outdir+"/include/zlib.h"
    if not os.path.exists(check):
      #deps.fetch(repdir, outdir, ["zlib-1.2.3"])
      deps.fetch(repdir, outdir, ["zlib"])
  
    check = outdir+"/include/OpenEXR/OpenEXRConfig.h"
    if not os.path.exists(check):
      deps.fetch(repdir, outdir, ["openexr-%s" % ver if ver else "openexr"])
    
    if env.compiler_ver() > 7.1:
      env.Append(LIBS = env['OPENEXR_LIBS_VC80'])
    else:
      env.Append(LIBS = env['OPENEXR_LIBS_VC71'])
  else:
    env.Append(LIBS = env['OPENEXR_LIBS'])


def require_half(env, ver, **keywords):
  
  env.Append(CPPPATH = env['OPENEXR_CPPPATH'])
  env.Append(LIBPATH = env['OPENEXR_LIBPATH'])
  
  if env.platform() == "windows":
    outdir = ARGUMENTS.get('dependency-dir')
    repdir = "z:/marza/team/rnd/libs"

    check = outdir+"/include/zlib.h"
    if not os.path.exists(check):
      #deps.fetch(repdir, outdir, ["zlib-1.2.3"])
      deps.fetch(repdir, outdir, ["zlib"])

    check = outdir+"/include/OpenEXR/OpenEXRConfig.h"
    if not os.path.exists(check):
      deps.fetch(repdir, outdir, ["openexr-%s" % ver if ver else "openexr"])
    
    if env.compiler_ver() > 7.1:
      env.Append(LIBS = env['HALF_LIB_VC80'])
    else:
      env.Append(LIBS = env['HALF_LIB_VC71'])
  else:
    env.Append(LIBS = env['HALF_LIB'])


def configure_ext(env, deps_dir):
  
  if env.platform() == "windows":
    env['OPENEXR_CPPPATH']   = [deps_dir+'/include', deps_dir+'/include/OpenEXR']
    env['OPENEXR_LIBPATH']   = []
    env['OPENEXR_LIBS_VC71'] = ['Half_s-vc71', 'Iex_s-vc71', 'Imath_s-vc71', 'IlmImf_s-vc71', 'IlmThread_s-vc71', 'zlib']
    env['OPENEXR_LIBS_VC80'] = ['Half_s', 'Iex_s', 'Imath_s', 'IlmImf_s', 'IlmThread_s', 'zlib']
    env['HALF_LIB_VC71']     = ['Half_s-vc71']
    env['HALF_LIB_VC80']     = ['Half_s']
  elif env.platform() == "osx":
    env["OPENEXR_CPPPATH"] = ["/opt/local/include", "/opt/local/include/OpenEXR"]
    env["OPENEXR_LIBPATH"] = ["/opt/local/lib"]
    env["OPENEXR_LIBS"]    = ["Half", "Iex", "Imath", "IlmImf", "IlmThread"]
    env["HALF_LIB"]        = ["Half"]
  else:
    env["OPENEXR_CPPPATH"] = ["/usr/include", "/usr/include/OpenEXR"]
    env["OPENEXR_LIBPATH"] = []
    env["OPENEXR_LIBS"]    = ["Half", "Iex", "Imath", "IlmImf", "IlmThread"]
    env["HALF_LIB"]        = ["Half"]
  
  class new(env.__class__):
    pass
  setattr(new, "require_openexr", require_openexr)
  setattr(new, "require_half", require_half)
  env.__class__ = new
