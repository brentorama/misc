from SCons.Script import *
import sconsutils

map_include = {'RMStudio2' : 'PRMan14',
               'RfM3'      : 'PRMan14'}

map_lib = {'RfM3' : 'RMStudio2'}

map_ver = {'3Delight85' : '8.5',
           '3Delight8'  : '8.0',
           '3Delight9'  : '9.0',
           'PRMan14'    : '14',
           'PRMan15'    : '14',
           'RMStudio2'  : 'rms2',
           'RfM3'       : 'rms2'}

def require_renderman(env, ver):
  if ver in map_include:
    env.Append(CPPPATH = [env['RM_'+map_include[ver]+'_BASE']+'include'])
  else:
    env.Append(CPPPATH = [env['RM_'+ver+'_BASE']+'include'])
  
  if ver in map_lib:
    env.Append(LIBPATH = [env['RM_'+map_lib[ver]+'_BASE']+'lib'])
  else:
    env.Append(LIBPATH = [env['RM_'+ver+'_BASE']+'lib'])
  
  env.Append(LIBS = env['RM_'+ver+'_LIBS'])
  
  if ver.find('RMS') > -1:
    env.Append(CPPDEFINES=['RMS_BUILD'])


def _setup_rman_env(env, keywords):
  
  ver = keywords["renderman_ver"]
  
  if not "app" in keywords:
    if ver.startswith("3Delight"):
      keywords["app"] = "delight"
    else:
      keywords["app"] = "prman"
  
  if not "sources" in keywords:
    raise Exception("Missing \"sources\" keyword argument")
    
  name, subdir = env._make_any_pre(keywords)
  
  prefix = env.out_prefix()
  
  env['SHLIBPREFIX'] = env['RMAN_SHLIBPREFIX']
  env['SHLIBSUFFIX'] = env['RMAN_SHLIBSUFFIX']
  
  env.ignore_import_lib()
  
  dll  = "%s/%s/%s/%s/%s" % (env.out_dir(), prefix, map_ver[ver], env.platform(), env.arch())
  dll += subdir + "/" + name
  
  build_prefix = keywords.get("build_prefix", "rman-%s" % ver)
  if sys.platform == "win32":
    build_prefix += "/msvc-%s" % env.compiler_ver()
  env["OBJDIR"] = env.obj_dir() + "/" + build_prefix

  sconsutils.SetRPath(env, keywords)

  target = env.SharedLibrary(dll, env._collect_objects(keywords["sources"], sconsutils._shared_objects))
  
  keywords["build_files"] = {str(target[0]): "%s/%s/%s/%s" % (map_ver[ver], env.platform(), env.arch(), subdir)}
  if env.generates_manifest() and env.keep_manifest():
    keywords["build_files"][str(target[0])+".manifest"] = keywords["build_files"][str(target[0])]
  
  env._make_any_post(target, keywords)
  
  # extra cleanup MSVC shit !
  if env.platform() == "windows":
    if env.generates_manifest() and not env.keep_manifest():
      manifest = (str(target[0])+".manifest").replace("/", "\\")
      env.AddPostAction(target, "del /Q \"%s\"" % manifest)
    if env.build_debug():
      Clean(target, dll+'.ilk')
  else:
    env.Append(CCFLAGS = ["-fvisibility=hidden"])
  
  return target

def make_renderman_plugin(env, **keywords):
  if not "renderman_ver" in keywords:
    raise Exception("Missing \"renderman_ver\" keyword argument")
  env.require_renderman(keywords["renderman_ver"])
  return _setup_rman_env(env, keywords)


def configure_ext(env, deps_dir):
  if env.platform() == "windows":
    if env.build_64():
      env['RM_3Delight8_BASE'] = 'Z:/marza/tools/renderman/3Delight/8.0.6/x64/'
      env['RM_3Delight85_BASE'] = 'Z:/marza/tools/renderman/3Delight/8.5.11/x64/'
      env['RM_3Delight9_BASE'] = 'Z:/marza/tools/renderman/3Delight/9.0.0/x64/'
      env['RM_PRMan14_BASE'] = 'Z:/marza/tools/renderman/RenderManProServer-14.4/'
      env['RM_PRMan15_BASE'] = 'Z:/marza/tools/renderman/RenderManProServer-15.0/' # not tested!!!!
      env['RM_RMStudio2_BASE'] = 'Z:/marza/tools/maya/ext/RenderManStudio/2.0.1/RenderManStudio-2.0.1-maya2009-x64/'
      env['RM_RfM3_BASE'] = 'Z:/marza/tools/maya/ext/RenderManForMaya/RenderManForMaya-3.0.1-maya2009-x64'
    else:
      env['RM_3Delight8_BASE'] = 'Z:/marza/tools/renderman/3Delight/8.0.6/x86/'
      env['RM_3Delight85_BASE'] = 'Z:/marza/tools/renderman/3Delight/8.5.11/x86/'
      env['RM_3Delight9_BASE'] = 'Z:/marza/tools/renderman/3Delight/9.0.0/x86/'
      env['RM_PRMan14_BASE'] = 'Z:/marza/tools/renderman/RenderManProServer-14.0/'
      env['RM_RMStudio2_BASE'] = 'Z:/marza/tools/maya/ext/RenderManStudio/2.0.1/RenderManStudio-2.0.1-maya2009/'
      env['RM_RfM3_BASE'] = 'Z:/marza/tools/maya/ext/RenderManForMaya/RenderManForMaya-3.0.1-maya2009'
    
    env['RMAN_SHLIBPREFIX'] = ''
    env['RMAN_SHLIBSUFFIX'] = '.dll'
  elif env.platform() == "osx":
    env['RM_3Delight8_BASE'] = '/Applications/Graphics/3Delight-8.0.0/'
    env['RM_3Delight85_BASE'] = '/Applications/Graphics/3Delight-8.5.0/'
    env['RM_3Delight9_BASE'] = '/Applications/Graphics/3Delight-9.0.0/'
    
    env['RMAN_SHLIBPREFIX'] = ''
    env['RMAN_SHLIBSUFFIX'] = '.bundle'
  else:
    if env.build_64():
      env['RM_3Delight8_BASE'] = '/marza/tools/renderman/3delight/8.0.24/Linux-x86_64/'
      env['RM_3Delight85_BASE'] = '/marza/tools/renderman/3delight/8.5.11/Linux-x86_64/'
      env['RM_3Delight9_BASE'] = '/marza/tools/renderman/3delight/9.0.0/Linux-x86_64/'
    else:
      env['RM_3Delight8_BASE'] = '/marza/tools/renderman/3delight/8.0.24/Linux-x86/'
      env['RM_3Delight85_BASE'] = '/marza/tools/renderman/3delight/8.5.11/Linux-x86/'
      env['RM_3Delight9_BASE'] = '/marza/tools/renderman/3delight/9.0.0/Linux-x86/'
    
    env['RMAN_SHLIBPREFIX'] = ''
    env['RMAN_SHLIBSUFFIX'] = '.so'

  env['RM_3Delight8_LIBS'] = ['3delight']
  env['RM_3Delight85_LIBS'] = ['3delight']
  env['RM_3Delight9_LIBS'] = ['3delight']
  env['RM_PRMan14_LIBS'] = ['libprman']
  env['RM_PRMan15_LIBS'] = ['libprman']
  env['RM_RMStudio2_LIBS'] = ['RenderMan_for_Maya']
  env['RM_RfM3_LIBS'] = ['RenderMan_for_Maya']
  
  class new(env.__class__):
    pass
  setattr(new, "require_renderman", require_renderman)
  setattr(new, "make_renderman_plugin", make_renderman_plugin)
  env.__class__ = new
