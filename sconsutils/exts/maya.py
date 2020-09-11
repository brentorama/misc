from SCons.Script import *
import sconsutils
import sys

_maya_mscver = {"2013"  : "9.0",  # Visual Studio 2008
                "2014"  : "10.0", # Visual Studio 2010
                "2015"  : "11.0", # Visual Studio 2012 Update 4
                "2016"  : "11.0", # Visual Studio 2012 Update 4
                "2016.5": "11.0", # Visual Studio 2012 Update 4
                "2017"  : "11.0", # Visual Studio 2012 Update 4
                "2018"  : "14.0", # Visual Studio 2015 Update 3
                "2019"  : "14.0"}


def setup_mscver(mayaver):
  if sys.platform == "win32":
    mscver = ARGUMENTS.get("mscver", None)
    if mscver is None:
      mscver = _maya_mscver.get(mayaver, None)
      if mscver is not None:
        print("Using msvc %s" % mscver)
        ARGUMENTS["mscver"] = mscver

def _setup_maya_env(env, keywords):
  if not "app" in keywords:
    keywords["app"] = "maya"
  
  if not "sources" in keywords:
    raise Exception("Missing \"sources\" keyword argument")
  
  ver = keywords["maya_ver"]
  
  name, subdir = env._make_any_pre(keywords)
  
  prefix = env.out_prefix()
  
  env['SHLIBPREFIX'] = env['MAYA_SHLIBPREFIX']
  env['SHLIBSUFFIX'] = env['MAYA_SHLIBSUFFIX']
  env.ignore_import_lib()
  
  mll  = "%s/%s/%s/plug-ins/%s/%s" % (env.out_dir(), prefix, ver, env.platform(), env.arch())
  mll += subdir + "/" + name
  
  build_prefix = keywords.get("build_prefix", "maya-%s" % ver)
  if sys.platform == "win32":
    build_prefix += "/msvc-%s" % env.compiler_ver()
  env["OBJDIR"] = env.obj_dir() + "/" + build_prefix

  sconsutils.SetRPath(env, keywords)

  target = env.SharedLibrary(mll, env._collect_objects(keywords["sources"], sconsutils._shared_objects))
  
  keywords["build_files"] = {str(target[0]): "%s/plug-ins/%s/%s/%s" % (ver, env.platform(), env.arch(), subdir)}
  if env.generates_manifest() and env.keep_manifest():
    keywords["build_files"][str(target[0])+".manifest"] = keywords["build_files"][str(target[0])]
  
  env._make_any_post(target, keywords)
  
  # extra cleanup MSVC shit !
  if env.platform() == "windows":
    if env.generates_manifest() and not env.keep_manifest():
      manifest = (str(target[0])+".manifest").replace("/", "\\")
      env.AddPostAction(target, "del /Q \"%s\"" % manifest)
    if env.build_debug():
      Clean(target, mll+'.ilk')
  else:
    env.Append(CCFLAGS = ["-fvisibility=hidden"])
  
  return target

def require_maya(env, ver):
  ndver = ver.replace(".", "")
  
  arch = "_64" if env.build_64() and "osx" != env.platform() else ""
  
  env.Append(CPPDEFINES = env['MAYA_CPPDEFINES'])
  env.Append(CCFLAGS    = env['MAYA_CCFLAGS'])
  env.Append(CPPPATH    = [env['MAYA_'+ndver+arch+'_CPPPATH']])
  env.Append(LIBPATH    = [env['MAYA_'+ndver+arch+'_LIBPATH']])
  env.Append(LIBS       = env['MAYA_LIBS'])
  env['MAYA_ROOT'] = env['MAYA_'+ndver+arch+'_ROOT']
  
  optkey = "MAYA_"+ndver+arch+"_CCFLAGS"
  if optkey in env:
    env.Append(CCFLAGS = env[optkey])
  
  optkey = "MAYA_"+ndver+arch+"_LINKFLAGS"
  if optkey in env:
    env.Append(LINKFLAGS = env[optkey])
  
  if env.platform() == "osx":
    # Change from '$LINKFLAGS -dynamiclib'
    env['SHLINKFLAGS'] = '$LINKFLAGS -bundle'

def make_maya7_plugin(env, **keywords):
  keywords["maya_ver"] = "7.0"
  env.require_maya(keywords["maya_ver"])
  return _setup_maya_env(env, keywords)

def make_maya8_plugin(env, **keywords):
  keywords["maya_ver"] = "8.0"
  env.require_maya(keywords["maya_ver"])
  return _setup_maya_env(env, keywords)

def make_maya85_plugin(env, **keywords):
  keywords["maya_ver"] = "8.5"
  env.require_maya(keywords["maya_ver"])
  return _setup_maya_env(env, keywords)

def make_maya2008_plugin(env, **keywords):
  keywords["maya_ver"] = "2008"
  env.require_maya(keywords["maya_ver"])
  return _setup_maya_env(env, keywords)

def make_maya2009_plugin(env, **keywords):
  keywords["maya_ver"] = "2009"
  env.require_maya(keywords["maya_ver"])
  return _setup_maya_env(env, keywords)

def make_maya2011_plugin(env, **keywords):
  keywords["maya_ver"] = "2011"
  env.require_maya(keywords["maya_ver"])
  return _setup_maya_env(env, keywords)

def make_maya2013_plugin(env, **keywords):
  keywords["maya_ver"] = "2013"
  env.require_maya(keywords["maya_ver"])
  return _setup_maya_env(env, keywords)

def make_maya2014_plugin(env, **keywords):
  keywords["maya_ver"] = "2014"
  env.require_maya(keywords["maya_ver"])
  return _setup_maya_env(env, keywords)

def make_maya2015_plugin(env, **keywords):
  keywords["maya_ver"] = "2015"
  env.require_maya(keywords["maya_ver"])
  return _setup_maya_env(env, keywords)

def make_maya2016_plugin(env, **keywords):
  keywords["maya_ver"] = "2016"
  env.require_maya(keywords["maya_ver"])
  return _setup_maya_env(env, keywords)

def make_maya20165_plugin(env, **keywords):
  keywords["maya_ver"] = "2016.5"
  env.require_maya(keywords["maya_ver"])
  return _setup_maya_env(env, keywords)

def make_maya2017_plugin(env, **keywords):
  keywords["maya_ver"] = "2017"
  env.require_maya(keywords["maya_ver"])
  return _setup_maya_env(env, keywords)

def make_maya2018_plugin(env, **keywords):
  keywords["maya_ver"] = "2018"
  env.require_maya(keywords["maya_ver"])
  return _setup_maya_env(env, keywords)

def make_maya2019_plugin(env, **keywords):
  keywords["maya_ver"] = "2019"
  env.require_maya(keywords["maya_ver"])
  return _setup_maya_env(env, keywords)

def make_maya_plugin(env, **keywords):
  if not "maya_ver" in keywords:
    raise Exception("Missing \"maya_ver\" keyword argument")
  env.require_maya(keywords["maya_ver"])
  return _setup_maya_env(env, keywords)

def configure_ext(env, deps_dir):
  
  # Maya 2016 didn't come with SDK
  # For windows and linux platform, this was restore in 2016.5
  #   for on OSX, it stayed that way since
  # Allow for manual specification of SDK path
  devkit = ARGUMENTS.get("mayadevkit", None)

  if env.platform() == "windows":
    env['MAYA_CPPDEFINES']  = ['NT_PLUGIN', '_BOOL', 'REQUIRE_IOSTREAM']
    env['MAYA_CCFLAGS']     = []
    env['MAYA_LIBS']        = ['OpenMayaFX', 'OpenMayaAnim', 'OpenMayaUI', 'OpenMayaRender', 'OpenMaya', 'Foundation']
    env['MAYA_SHLIBPREFIX'] = ''
    env['MAYA_SHLIBSUFFIX'] = '.mll'
    
    basepath = "C:/Program Files/Alias/Maya7.0/"
    env['MAYA_70_CPPPATH'] = basepath + "include"
    env['MAYA_70_LIBPATH'] = basepath + "lib"
    env['MAYA_70_ROOT'] = basepath
    
    basepath = "C:/Program Files/Alias/Maya8.0/"
    env['MAYA_80_CPPPATH'] = basepath + "include"
    env['MAYA_80_LIBPATH'] = basepath + "lib"
    env['MAYA_80_ROOT'] = basepath
    
    basepath = "C:/Program Files/Autodesk/Maya8.5/"
    env['MAYA_85_CPPPATH'] = basepath + "include"
    env['MAYA_85_LIBPATH'] = basepath + "lib"
    env['MAYA_85_ROOT'] = basepath
    
    basepath = "C:/Program Files (x86)/Autodesk/Maya2008/"
    env['MAYA_2008_CPPPATH'] = basepath + "include"
    env['MAYA_2008_LIBPATH'] = basepath + "lib"
    env['MAYA_2008_ROOT'] = basepath
    
    basepath = "C:/Program Files (x86)/Autodesk/Maya2009/"
    env['MAYA_2009_CPPPATH'] = basepath + "include"
    env['MAYA_2009_LIBPATH'] = basepath + "lib"
    env['MAYA_2009_ROOT'] = basepath
    
    basepath = "C:/Program Files/Autodesk/Maya2008/"
    env['MAYA_2008_64_CPPPATH'] = basepath + "include"
    env['MAYA_2008_64_LIBPATH'] = basepath + "lib"
    env['MAYA_2008_64_ROOT'] = basepath
    
    basepath = "C:/Program Files/Autodesk/Maya2009/"
    env['MAYA_2009_64_CPPPATH'] = basepath + "include"
    env['MAYA_2009_64_LIBPATH'] = basepath + "lib"
    env['MAYA_2009_64_ROOT'] = basepath
    
    basepath = "C:/Program Files/Autodesk/Maya2011/"
    env['MAYA_2011_64_CPPPATH'] = basepath + "include"
    env['MAYA_2011_64_LIBPATH'] = basepath + "lib"
    env['MAYA_2011_64_ROOT'] = basepath
    
    basepath = "C:/Program Files/Autodesk/Maya2013/"
    env['MAYA_2013_64_CPPPATH'] = basepath + "include"
    env['MAYA_2013_64_LIBPATH'] = basepath + "lib"
    env['MAYA_2013_64_ROOT'] = basepath
    
    basepath = "C:/Program Files/Autodesk/Maya2014/"
    env['MAYA_2014_64_CPPPATH'] = basepath + "include"
    env['MAYA_2014_64_LIBPATH'] = basepath + "lib"
    env['MAYA_2014_64_ROOT'] = basepath
    
    basepath = "C:/Program Files/Autodesk/Maya2015/"
    env['MAYA_2015_64_CPPPATH'] = basepath + "include"
    env['MAYA_2015_64_LIBPATH'] = basepath + "lib"
    env['MAYA_2015_64_ROOT'] = basepath
    
    basepath = "C:/Program Files/Autodesk/Maya2016/"
    incdir = ((basepath + "devkitBase/include") if devkit is None else (devkit + "/include"))
    if not os.path.isdir(incdir):
      incdir = basepath + "include"
    env['MAYA_2016_64_CPPPATH'] = incdir
    env['MAYA_2016_64_LIBPATH'] = basepath + "lib"
    env['MAYA_2016_64_ROOT'] = basepath
    
    basepath = "C:/Program Files/Autodesk/Maya2016.5/"
    incdir = ((basepath + "devkitBase/include") if devkit is None else (devkit + "/include"))
    if not os.path.isdir(incdir):
      incdir = basepath + "include"
    env['MAYA_20165_64_CPPPATH'] = incdir
    env['MAYA_20165_64_LIBPATH'] = basepath + "lib"
    env['MAYA_20165_64_ROOT'] = basepath
    
    basepath = "C:/Program Files/Autodesk/Maya2017/"
    incdir = ((basepath + "devkitBase/include") if devkit is None else (devkit + "/include"))
    if not os.path.isdir(incdir):
      incdir = basepath + "include"
    env['MAYA_2017_64_CPPPATH'] = incdir
    env['MAYA_2017_64_LIBPATH'] = basepath + "lib"
    env['MAYA_2017_64_ROOT'] = basepath

    basepath = "C:/Program Files/Autodesk/Maya2018/"
    incdir = ((basepath + "devkitBase/include") if devkit is None else (devkit + "/include"))
    if not os.path.isdir(incdir):
      incdir = basepath + "include"
    env['MAYA_2018_64_CPPPATH'] = incdir
    env['MAYA_2018_64_LIBPATH'] = basepath + "lib"
    env['MAYA_2018_64_ROOT'] = basepath

    basepath = "C:/Program Files/Autodesk/Maya2019/"
    incdir = ((basepath + "devkitBase/include") if devkit is None else (devkit + "/include"))
    if not os.path.isdir(incdir):
      incdir = basepath + "include"
    env['MAYA_2019_64_CPPPATH'] = incdir
    env['MAYA_2019_64_LIBPATH'] = basepath + "lib"
    env['MAYA_2019_64_ROOT'] = basepath
  
  elif env.platform() == "osx":
    env['MAYA_CPPDEFINES']  = ["OSMac_", "_BOOL", "REQUIRE_IOSTREAM"]
    env['MAYA_CCFLAGS']     = []
    env['MAYA_LIBS']        = ["Foundation", "OpenMaya", "OpenMayaFX", "OpenMayaAnim", "OpenMayaUI", "OpenMayaRender"]
    env['MAYA_SHLIBPREFIX'] = ""
    env['MAYA_SHLIBSUFFIX'] = ".bundle"
    
    def forceOpenMayaMac(key, basepath):
      openMayaHeader = basepath + "/devkit/include/maya/OpenMayaMac.h"
      if os.path.isfile(openMayaHeader):
        if key in env:
          env[key] += " -include %s" % basepath
        else:
          env[key]  = "-include %s" % basepath
    
    basepath = "/Applications/Autodesk/maya2009"
    env['MAYA_2009_ROOT']      = basepath
    env['MAYA_2009_CPPPATH']   = basepath + "/devkit/include"
    env['MAYA_2009_LIBPATH']   = basepath + "/Maya.app/Contents/MacOS"
    env['MAYA_2009_LINKFLAGS'] = "-Wl,-executable_path," + basepath + "/Maya.app/Contents/MacOS"
    forceOpenMayaMac('MAYA_2009_CCFLAGS', basepath)

    basepath = "/Applications/Autodesk/maya2011"
    env['MAYA_2011_ROOT']      = basepath
    env['MAYA_2011_CPPPATH']   = basepath + "/devkit/include"
    env['MAYA_2011_LIBPATH']   = basepath + "/Maya.app/Contents/MacOS"
    env['MAYA_2011_LINKFLAGS'] = "-Wl,-executable_path," + basepath + "/Maya.app/Contents/MacOS"
    forceOpenMayaMac('MAYA_2011_CCFLAGS', basepath)
    
    basepath = "/Applications/Autodesk/maya2013"
    env['MAYA_2013_ROOT']      = basepath
    env['MAYA_2013_CPPPATH']   = basepath + "/devkit/include"
    env['MAYA_2013_LIBPATH']   = basepath + "/Maya.app/Contents/MacOS"
    env['MAYA_2013_LINKFLAGS'] = "-Wl,-executable_path," + basepath + "/Maya.app/Contents/MacOS"
    forceOpenMayaMac('MAYA_2013_CCFLAGS', basepath)
    
    basepath = "/Applications/Autodesk/maya2014"
    env['MAYA_2014_ROOT']      = basepath
    env['MAYA_2014_CPPPATH']   = basepath + "/devkit/include"
    env['MAYA_2014_LIBPATH']   = basepath + "/Maya.app/Contents/MacOS"
    env['MAYA_2014_LINKFLAGS'] = "-Wl,-executable_path," + basepath + "/Maya.app/Contents/MacOS"
    forceOpenMayaMac('MAYA_2014_CCFLAGS', basepath)
    
    basepath = "/Applications/Autodesk/maya2015"
    env['MAYA_2015_ROOT']      = basepath
    env['MAYA_2015_CPPPATH']   = basepath + "/devkit/include"
    env['MAYA_2015_LIBPATH']   = basepath + "/Maya.app/Contents/MacOS"
    env['MAYA_2015_LINKFLAGS'] = "-Wl,-executable_path," + basepath + "/Maya.app/Contents/MacOS"
    forceOpenMayaMac('MAYA_2015_CCFLAGS', basepath)

    basepath = "/Applications/Autodesk/maya2016"
    env['MAYA_2016_ROOT']      = basepath
    env['MAYA_2016_CPPPATH']   = ((basepath + "/devkit/include") if devkit is None else (devkit + "/include"))
    env['MAYA_2016_LIBPATH']   = basepath + "/Maya.app/Contents/MacOS"
    env['MAYA_2016_LINKFLAGS'] = "-Wl,-executable_path," + basepath + "/Maya.app/Contents/MacOS"
    forceOpenMayaMac('MAYA_2016_CCFLAGS', basepath)
    
    basepath = "/Applications/Autodesk/maya2016.5"
    env['MAYA_20165_ROOT']      = basepath
    env['MAYA_20165_CPPPATH']   = ((basepath + "/devkit/include") if devkit is None else (devkit + "/include"))
    env['MAYA_20165_LIBPATH']   = basepath + "/Maya.app/Contents/MacOS"
    env['MAYA_20165_LINKFLAGS'] = "-Wl,-executable_path," + basepath + "/Maya.app/Contents/MacOS"
    forceOpenMayaMac('MAYA_20165_CCFLAGS', basepath)
    
    basepath = "/Applications/Autodesk/maya2017"
    env['MAYA_2017_ROOT']      = basepath
    env['MAYA_2017_CPPPATH']   = ((basepath + "/devkit/include") if devkit is None else (devkit + "/include"))
    env['MAYA_2017_LIBPATH']   = basepath + "/Maya.app/Contents/MacOS"
    env['MAYA_2017_LINKFLAGS'] = "-Wl,-executable_path," + basepath + "/Maya.app/Contents/MacOS"
    forceOpenMayaMac('MAYA_2017_CCFLAGS', basepath)

    basepath = "/Applications/Autodesk/maya2018"
    env['MAYA_2018_ROOT']      = basepath
    env['MAYA_2018_CCFLAGS']   = ["-std=c++11"]
    env['MAYA_2018_CPPPATH']   = ((basepath + "/devkit/include") if devkit is None else (devkit + "/include"))
    env['MAYA_2018_LIBPATH']   = basepath + "/Maya.app/Contents/MacOS"
    env['MAYA_2018_LINKFLAGS'] = "-Wl,-executable_path," + basepath + "/Maya.app/Contents/MacOS"
    forceOpenMayaMac('MAYA_2018_CCFLAGS', basepath)
    
    basepath = "/Applications/Autodesk/maya2019"
    env['MAYA_2019_ROOT']      = basepath
    env['MAYA_2019_CCFLAGS']   = ["-std=c++11"]
    env['MAYA_2019_CPPPATH']   = ((basepath + "/devkit/include") if devkit is None else (devkit + "/include"))
    env['MAYA_2019_LIBPATH']   = basepath + "/Maya.app/Contents/MacOS"
    env['MAYA_2019_LINKFLAGS'] = "-Wl,-executable_path," + basepath + "/Maya.app/Contents/MacOS"
    forceOpenMayaMac('MAYA_2019_CCFLAGS', basepath)
    
  else:
    env['MAYA_CPPDEFINES']  = ['LINUX', '_BOOL', 'REQUIRE_IOSTREAM']
    env['MAYA_CCFLAGS']     = ['-m64', '-fPIC', '-fno-strict-aliasing', '-Wno-deprecated', '-O3', '-Wall', '-Wno-multichar', '-Wno-comment', '-Wno-sign-compare', '-funsigned-char', '-Wno-reorder', '-fno-gnu-keywords', '-ftemplate-depth-32', '-pthread']
    env['MAYA_LIBS']        = ['Foundation', 'OpenMaya', 'OpenMayaFX', 'OpenMayaAnim', 'OpenMayaUI', 'OpenMayaRender']
    env['MAYA_SHLIBPREFIX'] = ''
    env['MAYA_SHLIBSUFFIX'] = '.so'
    
    basepath = "/usr/autodesk/maya2009/"
    env['MAYA_2009_ROOT']    = basepath
    env['MAYA_2009_CPPPATH'] = basepath + "include"
    env['MAYA_2009_LIBPATH'] = basepath + "lib"
    
    basepath = "/usr/autodesk/maya2009-x64/"
    env['MAYA_2009_64_ROOT']    = basepath
    env['MAYA_2009_64_CPPPATH'] = basepath + "include"
    env['MAYA_2009_64_LIBPATH'] = basepath + "lib"
    
    basepath = "/usr/autodesk/maya2011-x64/"
    env['MAYA_2011_64_ROOT']    = basepath
    env['MAYA_2011_64_CPPPATH'] = basepath + "include"
    env['MAYA_2011_64_LIBPATH'] = basepath + "lib"
    
    basepath = "/usr/autodesk/maya2013-x64/"
    env['MAYA_2013_64_ROOT']    = basepath
    env['MAYA_2013_64_CPPPATH'] = basepath + "include"
    env['MAYA_2013_64_LIBPATH'] = basepath + "lib"
    
    basepath = "/usr/autodesk/maya2014-x64/"
    env['MAYA_2014_64_ROOT']    = basepath
    env['MAYA_2014_64_CPPPATH'] = basepath + "include"
    env['MAYA_2014_64_LIBPATH'] = basepath + "lib"
    
    basepath = "/usr/autodesk/maya2015-x64/"
    env['MAYA_2015_64_ROOT']    = basepath
    env['MAYA_2015_64_CPPPATH'] = basepath + "include"
    env['MAYA_2015_64_LIBPATH'] = basepath + "lib"
    
    basepath = "/usr/autodesk/maya2016/"
    incdir = ((basepath + "devkitBase/include") if devkit is None else (devkit + "/include"))
    if not os.path.isdir(incdir):
      incdir = basepath + "include"
    env['MAYA_2016_64_ROOT']    = basepath
    env['MAYA_2016_64_CPPPATH'] = incdir
    env['MAYA_2016_64_LIBPATH'] = basepath + "lib"
    
    basepath = "/usr/autodesk/maya2016.5/"
    incdir = ((basepath + "devkitBase/include") if devkit is None else (devkit + "/include"))
    if not os.path.isdir(incdir):
      incdir = basepath + "include"
    env['MAYA_20165_64_ROOT']    = basepath
    env['MAYA_20165_64_CPPPATH'] = incdir
    env['MAYA_20165_64_LIBPATH'] = basepath + "lib"
    
    basepath = "/usr/autodesk/maya2017/"
    incdir = ((basepath + "devkitBase/include") if devkit is None else (devkit + "/include"))
    if not os.path.isdir(incdir):
      incdir = basepath + "include"
    env['MAYA_2017_64_ROOT']    = basepath
    env['MAYA_2017_64_CPPPATH'] = incdir
    env['MAYA_2017_64_LIBPATH'] = basepath + "lib"

    basepath = "/usr/autodesk/maya2018/"
    incdir = ((basepath + "devkitBase/include") if devkit is None else (devkit + "/include"))
    if not os.path.isdir(incdir):
      incdir = basepath + "include"
    env['MAYA_2018_64_ROOT']    = basepath
    env['MAYA_2018_64_CPPPATH'] = incdir
    env['MAYA_2018_64_LIBPATH'] = basepath + "lib"
    env['MAYA_2018_64_CCFLAGS'] = ["-std=c++11"]
  
    basepath = "/usr/autodesk/maya2019/"
    incdir = ((basepath + "devkitBase/include") if devkit is None else (devkit + "/include"))
    if not os.path.isdir(incdir):
      incdir = basepath + "include"
    env['MAYA_2019_64_ROOT']    = basepath
    env['MAYA_2019_64_CPPPATH'] = incdir
    env['MAYA_2019_64_LIBPATH'] = basepath + "lib"
    env['MAYA_2019_64_CCFLAGS'] = ["-std=c++11"]
  
  class new(env.__class__):
    pass
  setattr(new, "require_maya", require_maya)
  setattr(new, "make_maya_plugin", make_maya_plugin)
  setattr(new, "make_maya7_plugin", make_maya7_plugin)
  setattr(new, "make_maya8_plugin", make_maya8_plugin)
  setattr(new, "make_maya85_plugin", make_maya85_plugin)
  setattr(new, "make_maya2008_plugin", make_maya2008_plugin)
  setattr(new, "make_maya2009_plugin", make_maya2009_plugin)
  setattr(new, "make_maya2011_plugin", make_maya2011_plugin)
  setattr(new, "make_maya2013_plugin", make_maya2013_plugin)
  setattr(new, "make_maya2014_plugin", make_maya2014_plugin)
  setattr(new, "make_maya2015_plugin", make_maya2015_plugin)
  setattr(new, "make_maya2016_plugin", make_maya2016_plugin)
  setattr(new, "make_maya20165_plugin", make_maya20165_plugin)
  setattr(new, "make_maya2017_plugin", make_maya2017_plugin)
  setattr(new, "make_maya2018_plugin", make_maya2018_plugin)
  setattr(new, "make_maya2019_plugin", make_maya2019_plugin)
  env.__class__ = new
