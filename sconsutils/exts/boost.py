from SCons.Script import *
from sconsutils import deps
import os.path
import glob
import re

def require_boost(env, ver=None, **kwargs):
  if env.platform() == "windows":
    outdir = ARGUMENTS.get('dependency-dir')
    repdir = "z:/marza/team/rnd/libs"
    check = outdir+"/include/boost/config.hpp"
    if not os.path.exists(check):
      deps.fetch(repdir, outdir, ["boost-%s" % ver if ver else "boost"])
    if "boost_libs" in kwargs:
      alllibs = outdir+"/lib/"
      if env.build_64():
        alllibs += "x64/*.lib"
      else:
        alllibs += "x86/*.lib"
      for lib in kwargs["boost_libs"]:
        libname = "boost_%s" % lib
        check = outdir+"/lib/%s" % libname
        doFetch = True
        for l in glob.glob(alllibs):
          if re.search(libname, os.path.basename(l)):
            doFetch = False
            break
        if doFetch:
          deps.fetch(repdir, outdir, ["%s-%s" % (libname, ver) if ver else libname])
  
  if "boost_libs" in kwargs:
    if env.platform() == "windows":
      # All libs but Boost.Python are statically linked by default
      if "static_link" in kwargs and kwargs["static_link"]:
        for lib in kwargs["boost_libs"]:
          libname = lib.strip().split("-")[0]
          if libname == "python":
            env["BOOST_CPPDEFINES"].append("BOOST_PYTHON_STATIC_LIB")
          elif libname == "thread":
            env["BOOST_CPPDEFINES"].append("BOOST_THREAD_USE_LIB")
      else:
        for lib in kwargs["boost_libs"]:
          libname = lib.strip().split("-")[0]
          if libname == "thread":
            env["BOOST_CPPDEFINES"].append("BOOST_THREAD_USE_DLL")
          elif libname != "python":
            env["BOOST_CPPDEFINES"].append("BOOST_%s_DYN_LINK" % libname.upper())
    else:
      # Not required on windows (auto-linking)
      for lib in kwargs["boost_libs"]:
        env["BOOST_LIBS"].append("boost_%s" % lib.strip())
  
  env.Append(CPPDEFINES = env["BOOST_CPPDEFINES"])
  env.Append(CPPPATH = env["BOOST_CPPPATH"])
  env.Append(LIBPATH = env["BOOST_LIBPATH"])
  env.Append(LIBS = env["BOOST_LIBS"])
  

def configure_ext(env, deps_dir):
  
  if env.platform() == "windows":
    env["BOOST_CPPDEFINES"] = []
    env["BOOST_CPPPATH"] = [deps_dir+'/include']
    env["BOOST_LIBPATH"] = []
    env["BOOST_LIBS"] = []
  elif env.platform() == "osx":
    env["BOOST_CPPDEFINES"] = []
    env["BOOST_CPPPATH"] = ["/opt/local/include"]
    env["BOOST_LIBPATH"] = ["/opt/local/lib"]
    env["BOOST_LIBS"] = []
  else:
    env["BOOST_CPPDEFINES"] = []
    env["BOOST_CPPPATH"] = []
    env["BOOST_LIBPATH"] = []
    env["BOOST_LIBS"] = []
  
  class new(env.__class__):
    pass
  setattr(new, "require_boost", require_boost)
  env.__class__ = new


