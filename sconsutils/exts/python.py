from SCons.Script import *
from distutils import sysconfig
import sconsutils
import subprocess
import re
import os
import glob

_pypath_win = {"x64": {"2.5": "Y:/ve/tools/python/python25_64",
                       "2.6": "Y:/ve/tools/python/python26_64",
                       "2.7": "Y:/ve/tools/python/python27_64"},
               "x86": {"2.5": "Y:/ve/tools/python/python25",
                       "2.6": "Y:/ve/tools/python/python26"}}

_spec_cache = {}

def _get_version_osx(pythonPath):
  # On osx, pythonPath must be the path to the python framework
  # i.e.  with-python=/System/Library/Frameworks/Python.framework
  p = subprocess.Popen("ls -l %s/Versions | grep Current" % pythonPath, shell=True, stdout=subprocess.PIPE)
  out, err = p.communicate()
  m = re.search(r"Current\s+->\s+(%s/Versions/)?([0-9\.]+)" % pythonPath, out)
  if m is not None:
    return m.group(2)
  return None

def _get_version_win(pythonPath):
  # On windows, pythonPath must be the path to the python executable
  # i.e.  with-python=C:/Python27/python.exe
  dn = os.path.dirname(pythonPath)
  fl = glob.glob(os.path.join(dn, "python*.dll"))
  if len(fl) == 1:
    m = re.match(r"python(\d)(\d)\.dll", os.path.basename(fl[0]), re.IGNORECASE)
    if m is not None:
      return "%s.%s" % (m.group(1), m.group(2))
  return None

def _get_version_unix(pythonPath):
  # On unix, pythonPath must be the path to the python executable
  # i.e.  with-python=/usr/local/bin/python
  p = subprocess.Popen("ldd %s | grep libpython" % pythonPath, shell=True, stdout=subprocess.PIPE)
  out, err = p.communicate()
  m = re.search(r"libpython([0-9\.]+)\.so", out)
  if m is not None:
    return m.group(1)
  return None

def get_python_spec(env):
  global _spec_cache, _pypath_win
  
  specstr = ARGUMENTS.get("python", ARGUMENTS.get("pythonver", None))
  # 'python'
  #   on windows/linux : path to python executable
  #   on osx           : path to python framework

  if specstr is None:
    return None
  
  if specstr in _spec_cache:
    return _spec_cache[specstr]
  
  spec = None
  
  if re.match(r"\d+\.\d+", specstr):
    ver = specstr
    
    if env.platform() == "windows":
      path = _pypath_win.get(env.arch(), {}).get(ver, None)
      if path:
        incdir = path + "/include"
        libdir = path + "/libs"
        lib = "python%s" % ver.replace(".", "")
        spec = (ver, incdir, libdir, lib)
    
    elif env.platform() == "osx":
      for search_path in ["/System/Library/Frameworks", "/Library/Frameworks"]:
        path = os.path.join(search_path, "Python.framework", "Versions", ver)
        if os.path.isdir(path):
          if ver == _get_version_osx(os.path.join(search_path, "Python.framework")):
            spec = (ver, "%s/Headers" % path, search_path, "Python")
          else:
            spec = (ver, "%s/Headers" % path, None, "%s/Python" % path)
          break
    
    else:
      prefix = None
      
      for search_path in ["/usr", "/usr/local"]:
        path = os.path.join(search_path, "bin", "python%s" % ver)
        if not os.path.isfile(path):
          path = os.path.join(search_path, "bin", "python")
          if os.path.isfile(path) and _get_version_unix() == ver:
            prefix = search_path
            break
        else:
          prefix = search_path
          break
      
      if prefix:
        incdir = prefix + "/include/python%s" % ver
        libdir = prefix + ("/lib64" if env.arch() == "x64" else "/lib")
        lib = "python%s" % ver
        spec = (ver, incdir, libdir, lib)
  
  else:
    if env.platform() == "osx":
      if specstr[-1] == "/":
        specstr = specstr[:-1]
      m = re.search(r"/([^/]+)\.framework/Versions/([^/]+)/?$", specstr)
      if m:
        fwn = m.group(1)
        fw = "%s/%s" % (specstr, fwn)
        fwh = "%s/Headers" % specstr
        if os.path.isfile(fw) and os.path.isdir(fwh):
          ver = m.group(2)
          fwd = re.sub(r"/Versions/.*$", "", specstr)
          if ver == _get_version_osx(fwd):
            spec = (ver, fwh, os.path.dirname(fwd), fwn)
          else:
            spec = (ver, fwh, None, fw)
      else:
        ver = _get_version_osx(specstr)
        if ver is not None:
          d = os.path.dirname(specstr)
          n = os.path.splitext(os.path.basename(specstr))[0]
          spec = (ver, "%s/Versions/%s/Headers" % (specstr, ver), d, n)
    
    elif env.platform() == "windows":
      ver = _get_version_win(specstr)
      if ver is not None:
        d = os.path.dirname(specstr)
        incdir = d + "/include"
        libdir = d + "/libs"
        lib = "python%s" % ver.replace(".", "")
        spec = (ver, incdir, libdir, lib)
    
    else:
      ver = _get_version_unix(specstr)
      if ver is not None:
        d = os.path.dirname(specstr)
        if os.path.basename(d) == "bin":
          d = os.path.dirname(d)
          incdir = d + "/include/python%s" % ver
          libdir = d + ("/lib64" if env.arch() == "x64" else "/lib")
          lib = "python%s" % ver
          spec = (ver, incdir, libdir, lib)
  
  if spec is not None:
    v, id, ld, l = spec
    
    if env.platform() == "osx":
      if ld is None:
        if not os.path.isdir(id) or not os.path.isfile(l):
          spec = None
      else:
        if not os.path.isdir(id) or not os.path.isdir(ld):
          spec = None
    
    else:
      if not os.path.isdir(id) or not os.path.isdir(ld):
        spec = None
      else:
        if env.platform() == "windows":
          if not os.path.isfile("%s/%s.lib" % (ld, l)):
            spec = None
        else:
          if not os.path.isfile("%s/lib%s.so" % (ld, l)):
            spec = None
    
  _spec_cache[specstr] = spec
  
  return spec


def python_version(env):
  spec = get_python_spec(env)
  if spec is None:
    return sysconfig.get_python_version()
  else:
    return spec[0]

def require_python(env, build_module=False, osx_link="std"):
  if build_module:
    env.ignore_import_lib()
    env['SHLIBPREFIX'] = ''
    env['SHLIBSUFFIX'] = env['PY_MOD_SUFFIX']
    if env.platform() == "osx":
      # Change from '$LINKFLAGS -dynamiclib'
      env['SHLINKFLAGS'] = '$LINKFLAGS -bundle'
  
  spec = get_python_spec(env)
  
  if spec is not None:
    ver, incdir, libdir, lib = spec
    
    env.Append(CPPPATH = [incdir])
    if env.platform() == "osx":
      if osx_link == "runtime":
        env.Append(LINKFLAGS = " -undefined dynamic_lookup")
      else:
        if libdir is None:
          env.Append(LINKFLAGS = " %s" % lib)
        elif osx_link == "strict":
          env.Append(LINKFLAGS = " %s/%s.framework/Versions/%s/%s" % (libdir, lib, ver, lib))
        else:
          env.Append(LINKFLAGS = " -F%s -weak_framework %s" % (libdir, lib))
    else:
      env.Append(LIBPATH = [libdir])
      env.Append(LIBS = [lib])
    
    return
  
  # Fallback to default settings (the python version used by scons command)
  
  env.Append(CPPPATH   = env['PY_CPPPATH'])
  env.Append(LIBPATH   = env['PY_LIBPATH'])
  if env.platform() == "osx" and osx_link != "std":
    if osx_link == "strict":
      env.Append(LINKFLAGS = env['PY_LINKFLAGS_STRICT'])
    elif osx_link == "runtime":
      env.Append(LINKFLAGS = env['PY_LINKFLAGS_RUNTIME'])
  else:
    env.Append(LINKFLAGS = env['PY_LINKFLAGS'])
  env.Append(LIBS      = env['PY_LIBS'])

def make_python_ext(env, **keywords):
  if not "app" in keywords:
    keywords["app"] = "python"
  
  if not "sources" in keywords:
    raise Exception("Missing \"sources\" keywords argument")
  
  name, subdir = env._make_any_pre(keywords)
  
  prefix = env.out_prefix()
  
  if not "prefix" in keywords:
    prefix2 = "%s/%s" % (env.platform(), env.arch())
  else:
    prefix2 = keywords["prefix"]
  
  pyver = python_version(env)
  ext  = "%s/%s/%s/%s" % (env.out_dir(), prefix, pyver, prefix2)
  ext += subdir + "/" + name
  
  env.require_python(True, osx_link="runtime")
  
  build_prefix = keywords.get("build_prefix", "python-%s" % pyver)
  if sys.platform == "win32":
    build_prefix += "/msvc-%s" % env.compiler_ver()
  env["OBJDIR"] = env.obj_dir() + "/" + build_prefix

  sconsutils.SetRPath(env, keywords)

  target = env.SharedLibrary(ext, env._collect_objects(keywords["sources"], sconsutils._shared_objects))
  
  keywords["build_files"] = {str(target[0]): "%s/%s/%s" % (pyver, prefix2, subdir)}
  if env.generates_manifest() and env.keep_manifest():
    keywords["build_files"][str(target[0])+".manifest"] = keywords["build_files"][str(target[0])]
  
  env._make_any_post(target, keywords)
  
  # extra cleanup for windows
  if env.platform() == "windows":
    if env.generates_manifest() and not env.keep_manifest():
      manifest = (str(target[0])+'.manifest').replace("/", "\\")
      env.AddPostAction(target, "del /Q \"%s\"" % manifest)
    if env.build_debug():
      Clean(target, ext+'.ilk')
  else:
    env.Append(CCFLAGS = ["-fvisibility=hidden"])
  
  return target

def configure_ext(env, deps_dir):
  
  # Default settings (the python version used by scons command)
  
  env['PY_CPPPATH'] = [sysconfig.get_python_inc()]
  env['PY_MOD_SUFFIX'] = sysconfig.get_config_var("SO")
  if sysconfig.get_config_var("PYTHONFRAMEWORK"):
    env['PY_LIBPATH'] = []
    env['PY_LIBS'] = []
    a = ' -F' + sysconfig.get_config_var("PYTHONFRAMEWORKPREFIX")
    b = ' -weak_framework ' + sysconfig.get_config_var("PYTHONFRAMEWORK")
    env['PY_LINKFLAGS'] = a + b
    # Alternate way of linking python (to version specific framework)
    fwpath = sysconfig.get_config_var("PYTHONFRAMEWORKPREFIX")
    fwname = sysconfig.get_config_var("PYTHONFRAMEWORK")
    pyver = sysconfig.get_python_version()
    env["PY_LINKFLAGS_STRICT"] = " %s/%s.framework/Versions/%s/%s" % (fwpath, fwname, pyver, fwname)
    # Yet another way (seems to be the best for building modules)
    env["PY_LINKFLAGS_RUNTIME"] = " -undefined dynamic_lookup"
  else:
    ver = sysconfig.get_python_version()
    env['PY_LIBPATH'] = []
    if env.platform() == "windows":
      env['PY_LIBS'] = ["python%s" % ver.replace(".", "")]
    else:
      env['PY_LIBS'] = ["python%s" % ver]
    env['PY_LINKFLAGS'] = ''
  
  if env.platform() == "windows":
    env['PY_LIBPATH'] = [sysconfig.PREFIX+'\\libs']
  
  class new(env.__class__):
    pass
  setattr(new, "get_python_spec", get_python_spec)
  setattr(new, "require_python", require_python)
  setattr(new, "make_python_ext", make_python_ext)
  setattr(new, "python_version", python_version)
  env.__class__ = new
