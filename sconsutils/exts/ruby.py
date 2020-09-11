from SCons.Script import *
from string import Template
import os
import sconsutils

rb_conf = Template("ruby -e \"print (if require 'rbconfig' then Config else RbConfig end)::CONFIG['$flag']\"")

def make_ruby_ext(env, **keywords):
  if not "app" in keywords:
    keywords["app"] = "ruby"
  
  if not "sources" in keywords:
    raise Exception("Missing \"keyword\" argument")
  
  name, subdir = env._make_any_pre(keywords)
  
  prefix = env.out_prefix()
  
  ext  = "%s/%s/%s/%s/%s" % (env.out_dir(), prefix, env["RB_VERSION"], env.platform(), env.arch())
  ext += subdir + "/" + name
  
  env.require_ruby(True)
  
  build_prefix = keywords.get("build_prefix", "ruby-%s" % env["RB_VERSION"])
  if sys.platform == "win32":
    build_prefix += "/msvc-%s" % env.compiler_ver()
  env["OBJDIR"] = env.obj_dir() + "/" + build_prefix

  sconsutils.SetRPath(env, keywords)

  target = env.SharedLibrary(ext, env._collect_objects(keywords["sources"], sconsutils._shared_objects))
  
  keywords["build_files"] = {str(target[0]): "%s/%s/%s/%s" % (env["RB_VERSION"], env.platform(), env.arch(), subdir)}
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

def require_ruby(env, build_module=False):
  global rb_conf
  
  if not 'RB_CPPPATH' in env:
    env['RB_CPPPATH'] = [os.popen(rb_conf.substitute(flag='archdir')).read()]
  if not 'RB_LIBPATH' in env:
    env['RB_LIBPATH'] = [os.popen(rb_conf.substitute(flag='libdir')).read()]
  if not 'RB_LIBS' in env:
    env['RB_LIBS'] = [os.popen(rb_conf.substitute(flag='RUBY_SO_NAME')).read()]
  if not 'RB_MOD_SUFFIX' in env:
    env['RB_MOD_SUFFIX'] = '.' + os.popen(rb_conf.substitute(flag='DLEXT')).read()
  if not 'RB_VERSION' in env:
    env['RB_VERSION'] = os.popen(rb_conf.substitute(flag='ruby_version')).read()
  
  if build_module == True:
    env.ignore_import_lib()
    env['SHLIBPREFIX'] = ''
    env['SHLIBSUFFIX'] = env['RB_MOD_SUFFIX']
    if str(Platform()) == 'darwin':
      # Change from '$LINKFLAGS -dynamiclib'
      env['SHLINKFLAGS'] = '$LINKFLAGS -bundle'
  env.Append(CPPPATH = env['RB_CPPPATH'])
  env.Append(LIBPATH = env['RB_LIBPATH'])
  env.Append(LIBS    = env['RB_LIBS'])


def ruby_version(env):
  global rb_conf
  
  if not 'RB_VERSION' in env:
    env['RB_VERSION'] = os.popen(rb_conf.substitute(flag='ruby_version')).read()
  
  return env['RB_VERSION']

def configure_ext(env, deps_dir):
  class new(env.__class__):
    pass
  setattr(new, "make_ruby_ext", make_ruby_ext)
  setattr(new, "require_ruby", require_ruby)
  setattr(new, "ruby_version", lambda env: env["RB_VERSION"])
  env.__class__ = new
  
  

