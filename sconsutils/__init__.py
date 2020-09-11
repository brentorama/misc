import glob
import re
import os
import os.path
import sys
import shutil
import stat
import hashlib
import datetime
import platform as pyplatform
import xml.etree.cElementTree
import SCons
from SCons.Script import *

Version = "2.3.1"

version_c = """
#ifndef __${app}_${tool}_version_h_
#define __${app}_${tool}_version_h_

inline const char* ${app}_${tool}_version() {
  return "${version}";
}

#endif
"""

version_mel = """
global proc string ${app}_${tool}_version() {
  return "${version}";
}"""

version_ruby = """
def ${app}_${tool}_version()
  return "${version}"
end"""

version_python = """
def ${app}_${tool}_version():
  return "${version}"
"""

version_code_templates = {
  ".mel" : version_mel,
  ".h"   : version_c,
  ".hh"  : version_c,
  ".hxx" : version_c,
  ".hpp" : version_c,
  ".py"  : version_python,
  ".rb"  : version_ruby
}

library_paths = {}
library_names = {}
aliases = {}
target_keywords = {}
nodeploy = set()
deployment_dir = None

def abspath(path):
  if path != None:
    return os.path.abspath(path).replace("\\", "/")
  else:
    return None

def set_deployment_base(d):
  global deployment_dir
  if d is None:
    deployment_dir = "z:/marza/team/rnd/tools" if str(Platform()) == "win32" else "/marza/team/rnd/tools"
  else:
    deployment_dir = abspath(d)

set_deployment_base(ARGUMENTS.get("deploy-prefix", None))

def splitname(name):
  tmp = name.split('/')
  name = tmp[len(tmp)-1]
  subdir = ''
  if len(tmp) > 1:
    subdir = reduce(lambda r,x: r+'/'+x, tmp[0:-1], '')
    # subdir will start with a /
  return [name, subdir]

def _glob(pattern):
  return Glob(str(pattern))

def _splitext(path):
  return SCons.Util.splitext(str(path))

def _basename(path):
  return os.path.basename(str(path))

def _dirname(path):
  return os.path.dirname(str(path))

def _abspath(path):
  return abspath(str(path))

def _isdir(path):
  if not isinstance(path, SCons.Node.FS.Dir):
    return os.path.isdir(str(path))
  else:
    return True

def _isfile(path):
  if not isinstance(path, SCons.Node.FS.File):
    return os.path.isfile(str(path))
  else:
    return True

def _join(path1, path2):
  jp = os.path.join(str(path1), str(path2))
  try:
    items = _glob(jp)
  except:
    return jp
  else:
    return (items[0] if len(items) == 1 else jp)

def _shared_objects(env, pattern):
  return [env.SharedObject(env.obj_dir() + '/' + _splitext(src)[0], src) for src in _glob(pattern)]

def _static_objects(env, pattern):
  return [env.StaticObject(env.obj_dir() + '/' + _splitext(src)[0], src) for src in _glob(pattern)]

def _collect_objects(env, patterns, func):
  objects = []
  for pattern in patterns:
    objects += func(env, pattern)
  return objects

def _cleanup(env, target):
  Clean(target, env.build_dir()) 

def _check_template(path):
  try:
    dom = xml.etree.cElementTree.parse(path)
  except Exception, e:
    raise Exception("Invalid template file \"%s\": %s" % (path, e))

def _make_any_pre(env, keywords):
  if not "name" in keywords:
    raise Exception("Missing \"name\" keyword")
  
  if not "version" in keywords:
    raise Exception("Missing \"version\" keyword")
  
  if not "app" in keywords:
    raise Exception("Missing \"app\" keyword")
  
  name = keywords["name"]
  
  name, subdir = splitname(name)
  
  if not "tool" in keywords:
    keywords["tool"] = name
  
  prefix = "%s/%s/%s" % (keywords["app"], keywords["tool"], keywords["version"])
  env["OUT_PREFIX"] = prefix
  
  if "defines" in keywords:
    for d in keywords["defines"]:
      env.define(d)
  
  if "inc_paths" in keywords:
    for p in keywords["inc_paths"]:
      env.add_include_path(p)
  
  if "lib_paths" in keywords:
    for p in keywords["lib_paths"]:
      env.add_lib_path(p)
  
  if "libs" in keywords:
    for l in keywords["libs"]:
      if isinstance(l, basestring) and os.path.isfile(l):
        env.Append(LIBS = [env.File(l)])
      else:
        env.Append(LIBS = [l])
  
  return [name, subdir]

def _make_any_post(env, target, keywords):
  name = keywords["name"]
  
  appname  = keywords["app"]
  toolname = keywords["tool"]
  toolver  = keywords["version"]
  
  # cleanup
  env._cleanup(target)
  
  # key for installed files and alias
  targetkey = str(target[0])
  
  # alias
  if not "alias" in keywords:
    keywords["alias"] = name
  alias_name = keywords["alias"]
  Alias(alias_name, target)
  Export({alias_name: target})
  
  global aliases
  aliases[abspath(targetkey)] = alias_name
  
  if "verfiles" in keywords:
    gen_version_file(env, target, keywords)
  
  if "install_files" in keywords:
    for pattern, v in keywords["install_files"].iteritems():
      vt = type(v)
      if vt in (str, unicode):
        dstl = [v]
      elif vt in (tuple, list, set):
        dstl = list(v)
      else:
        continue
      
      for dst in dstl:
        for item in _glob(pattern):
          if _isdir(item):
            src = _abspath(item)
            patterns = None
          else:
            src = item.get_dir()
            patterns = [_basename(item)]
          
          env.install_files(target,
                            src, patterns,
                            env.out_dir() + "/" + env.out_prefix() + "/" + dst)
  
  if "links" in keywords:
    for dep in keywords["links"]:
      if type(dep) == str:
        env.link(target, dep)
      elif type(dep) == tuple and len(dep) == 2:
        env.link(target, dep[0], dep[1])
      else:
        print("*** Invalid link_dependency: %s" % str(dep))
  
  if "depends" in keywords:
    for dep in keywords["depends"]:
      if type(dep) == tuple and len(dep) == 2:
        env.depends(target, dep[0], dep[1])
      else:
        env.depends(target, dep)
  
  if "template" in keywords:
    app = keywords["app"]
    tool = keywords["tool"]
    tpl = abspath(keywords["template"])
    tpltgt = env.InstallAs("%s/%s/%s/all/all/template/%s.template" % (env.out_dir(), app, tool, tool), tpl)
    env.Depends(target, tpltgt)
  
  make_deploy_target(env, target, keywords)
  
  global target_keywords
  target_keywords[keywords["alias"]] = keywords

def generates_manifest(env):
  if env.platform() == "windows":
    mscver = env.compiler_ver()
    if mscver > 7.1 and mscver < 10:
      return True
  return False

def gen_version_file(env, target, info):
  if type(info) != dict:
    print("Cannot generate version file: Invalid deployment informations")
    return
  
  if not "verfiles" in info:
    return
  
  verfiles = info["verfiles"]
  
  var = re.compile(r"\$\{([^}]*)\}")
  
  for filepath, filecontent in verfiles.iteritems():
    # If no assiciated code, use default template fif any
    if filecontent == None:
      global version_code_templates
      ext = os.path.splitext(filepath)[1].lower()
      if ext in version_code_templates:
        filecontent = version_code_templates[ext]
      else:
        return
    
    m = var.search(filepath)
    while m != None:
      key = m.group(1)
      if not key in info:
        raise Exception("Cannot generate version file name: Referencing un-existing key \"%s\"" % key)
      filepath = filepath.replace(m.group(0), info[key])
      m = var.search(filepath)
    
    m = var.search(filecontent)
    while m != None:
      key = m.group(1)
      if not key in info:
        raise Exception("Cannot generate version file content: Referencing un-existing key \"%s\"" % key)
      filecontent = filecontent.replace(m.group(0), info[key])
      m = var.search(filecontent)
    
    f = open(filepath, "wb")
    f.write("%s\n\n" % filecontent)
    f.close()
    
    env.Clean(target, filepath)

def make_deploy_target(env, target, keywords):
  global deployment_dir
  
  if "nodeploy" in keywords and keywords["nodeploy"] == True:
    return
  
  if env.do_deploy():
    
    alias = get_alias(env, target)
    
    if len(COMMAND_LINE_TARGETS) == 0 or "." in COMMAND_LINE_TARGETS or alias in COMMAND_LINE_TARGETS:
      
      app = keywords["app"]
      tool = keywords["tool"]
      ver = keywords["version"]
      
      dst = abspath(os.path.join(deployment_dir, app))
      src = abspath(os.path.join(env.out_dir(), app, tool))
      
      dsources = env.get("DEPLOY_SOURCES", [])
      dtargets = env.get("DEPLOY_TARGETS", [])
      
      if "template" in keywords:
        _check_template(abspath(keywords["template"]))
        dsources.append(abspath(keywords["template"]))
        dtargets.append(os.path.join(dst, tool, "all", "all", "template", tool+".template"))
      
      def add_deploy_files(target_dict):
        for csrc, dstrel in target_dict.get("build_files", {}).iteritems():
          cdst = os.path.join(dst, tool, ver, dstrel, os.path.basename(csrc))
          dsources.append(csrc)
          dtargets.append(cdst)
        
        for csrc, v in target_dict.get("install_files", {}).iteritems():
          vt = type(v)
          if vt in (str, unicode):
            dstl = [v]
          elif vt in (tuple, list, set):
            dstl = list(v)
          else:
            continue
          
          for dstrel in dstl:
            cdst = os.path.join(dst, tool, ver, dstrel)
            for f in _glob(csrc):
              dsources.append(_abspath(f))
              dtargets.append(os.path.join(cdst, _basename(f)))
      
      add_deploy_files(keywords)
      
      if "depends" in keywords:
        global target_keywords
        
        for dep in keywords["depends"]:
          if type(dep) == tuple and len(dep) == 2:
            depname = dep[0]
          else:
            depname = dep
        
          kw = target_keywords.get(depname, {})
          if kw.get("tool", None) != tool:
            continue
          if kw.get("app", None) != app:
            continue
          add_deploy_files(kw)
      
      env['DEPLOY_SOURCES'] = dsources
      env['DEPLOY_TARGETS'] = dtargets
      
      global DeployAction
      env.AddPostAction(target, DeployAction)

def install_files(env, target, src, patterns, dst_dir):
  tgt = target
  
  def is_same_target(t, f, d):
    if abspath(os.path.join(d, _basename(f))) == abspath(str(t[0])):
      return True
    else:
      return False
  
  if _isdir(src):
    if patterns is None:
      dst_dir = os.path.join(dst_dir, _basename(src))
      patterns = ["*"]
    if type(patterns) in [str, unicode]:
      patterns = [patterns]
    for pattern in patterns:
      items = _glob(str(src) + '/' + pattern)
      for item in items:
        basename = _basename(item)
        if _isdir(item):
          rv = install_files(env, tgt, item, None, dst_dir)
          if tgt == None:
            tgt = rv
        else:
          if tgt is None:
            tgt = env.Install(dst_dir, item)
          elif not is_same_target(tgt, item, dst_dir):
            env.Depends(tgt, env.Install(dst_dir, item))
  else:
    if patterns:
      srcs = map(lambda x: str(src)+"/"+x, patterns)
      try:
        if tgt is None:
          tgt = env.Install(dst_dir, srcs)
        elif not is_same_target(tgt, src, dst_dir):
          env.Depends(tgt, env.Install(dst_dir, srcs))
        return
      except:
        pass
    # Fallback to old behaviour
    if tgt is None:
      tgt = env.Install(dst_dir, src)
    elif not is_same_target(tgt, src, dst_dir):
      env.Depends(tgt, env.Install(dst_dir, src))
  return tgt

def install_headers(env, target, src_dir, dst_dir):
  install_files(env, target, src_dir, ['*.h', '*.hpp', '*.hxx', '*.hh'], dst_dir)

def get_alias(env, target):
  targetkey = abspath(str(target[0]))
  global aliases
  return aliases[targetkey]

def set_import_lib(env, path):
  env['IMPLIB'] = path
  env.Append(LINKFLAGS = env['IMPLIBFLAGS'])
  ldir = os.path.dirname(path)
  if not os.path.exists(ldir):
    os.makedirs(ldir)
  env['no_import_lib'] = 1

def ignore_import_lib(env):
  env.Append(LINKFLAGS = env['NOIMPLIBFLAGS'])
  env['no_import_lib'] = 1

def no_console(env):
  if env.platform() == "windows":
    env.Append(LINKFLAGS = ' -entry:mainCRTStartup -subsystem:windows')

def define(env, flag):
  env.Append(CPPDEFINES = [flag])

def add_include_path(env, path):
  env.Append(CPPPATH = [path])

def add_lib_path(env, path):
  env.Append(LIBPATH = [path])

def depends(env, target, prj_name, prj_dir=None):
  global aliases, nodeploy
  # get project dir from command line if exists, defaults to project name
  if not prj_dir:
    prj_dir = abspath(ARGUMENTS.get(prj_name+'-dir', './'+prj_name))
  # reference scons project
  try:
    Import(prj_name)
  except:
    old_aliases = aliases.values()
    l = SConscript(abspath(prj_dir)+'/SConstruct')
    new_aliases = aliases.values()
    for a in new_aliases:
      if not a in old_aliases:
        nodeploy.add(a)
    # targets coming from another SConstruct should not be deployed
    nodeploy.add(prj_name)
  Depends(target, prj_name)

def link(env, target, prj_name, prj_dir=None):
  depends(env, target, prj_name, prj_dir)
  
  global library_paths, library_names
  if prj_name in library_paths:
    env.Append(LIBPATH = [library_paths[prj_name]])
  if prj_name in library_names:
    env.Append(LIBS = library_names[prj_name])
  else:
    env.Append(LIBS = [prj_name])

def SetRPath(env, settings, relpath=None, rpaths=[""]):
  if sys.platform != "win32":
    osx = (sys.platform == "darwin")

    all_rpaths = rpaths[:]

    # Keep 'relpath' for backward compatibility
    if relpath:
      all_rpaths.append(relpath)

    # Keep 'rpath' for backward compatibility (string expected)
    additional_rpath = settings.get("rpath", None)
    if additional_rpath and not additional_rpath in all_rpaths:
      all_rpaths.append(additional_rpath)

    # New 'rpaths' setting (string or collection)
    additional_rpaths = settings.get("rpaths", [])
    if type(additional_rpaths) in (str, unicode):
      additional_rpaths = [additional_rpaths]
    for rpath in additional_rpaths:
      if not rpath in all_rpaths:
        all_rpaths.append(rpath)

    for i in xrange(len(all_rpaths)):
      path = all_rpaths[i]
      if path is None:
        continue

      if not path.startswith("/"):
        if path:
          all_rpaths[i] = "%s/%s" % (("@loader_path" if osx else "$$ORIGIN"), path)
        else:
          all_rpaths[i] = ("@loader_path" if osx else "$$ORIGIN")

    # Remove -Wl,-rpath, not already in flags
    curlinkflags = str(env["LINKFLAGS"])
    linkflags = re.sub(r"\s*-Wl,-rpath,[^\s]*", "", curlinkflags)
    if linkflags != curlinkflags:
      print("Removed -Wl,-rpath from LINKFLAGS ('%s' -> '%s')" % (curlinkflags, linkflags))
      env["LINKFLAGS"] = linkflags

    if not osx:
      # enquotes because of possible $ sign
      rpath = "'%s'" % ":".join(all_rpaths)
      env.Append(LINKFLAGS=" -Wl,-rpath,%s,--enable-new-dtags" % rpath)
    else:
      rpath = ",".join(map(lambda x: "-rpath,%s" % x, all_rpaths))
      env.Append(LINKFLAGS=" -Wl,%s" % rpath)

def make_install(env, **keywords):
  if not "app" in keywords:
    raise Exception("\"app\" keyword must be set for make_install target builder")
  
  if not "install_files" in keywords:
    raise Exception("\"install_files\" keyword must be set for make_install target builder")
  
  if not "app_version" in keywords:
    keywords["app_version"] = "all"
  
  name, subdir = env._make_any_pre(keywords)
  
  appver = keywords["app_version"]
  
  global aliases
  target = None
  keywords["build_files"] = {}
  
  for pattern, v in keywords["install_files"].iteritems():
    vt = type(v)
    if vt in (str, unicode):
      dstl = [v]
    elif vt in (tuple, list, set):
      dstl = list(v)
    else:
      continue
    
    def collect_buildfiles(fpat, dst, extra_dir=None, stop_at_first=False):
      for f in _glob(fpat):
        if _isdir(f):
          bn = _basename(f)
          ed = bn if extra_dir is None else "%s/%s" % (extra_dir, bn)
          if stop_at_first:
            rv = collect_buildfiles(os.path.join(str(f), "*"), dst, extra_dir=ed, stop_at_first=True)
            if rv != None:
              return rv
          else:
            collect_buildfiles(os.path.join(str(f), "*"), dst, extra_dir = ed)
        else:
          ed = "" if extra_dir is None else "/%s" % extra_dir
          installed_path = "%s/%s/%s%s/%s" % (env.out_dir(), env.out_prefix(), dst, ed, _basename(f))
          keywords["build_files"][installed_path] = "%s%s" % (dst, ed)
          if stop_at_first:
            rv = env.install_files(None, f, None, env.out_dir()+"/"+env.out_prefix()+"/"+dst+ed)
            # Generate the version files [we might want to have then deployed also
            if "verfiles" in keywords:
              gen_version_file(env, target, keywords)
              del(keywords["verfiles"])
            return rv
      return None
    
    for dst in dstl:
      for item in _glob(pattern):
        if target is None:
          if _isfile(item):
            target = env.install_files(None, item, None, env.out_dir()+"/"+env.out_prefix()+"/"+dst)
          else:
            if _isdir(item):
              ed = _basename(item)
              pat = str(item) + "/*"
            else:
              ed = None
              pat = str(item)
            
            target = collect_buildfiles(pat, dst, extra_dir=ed, stop_at_first=True)
          
          if target is None:
            continue
        
        if _isdir(item):
          src = item
          patterns = None
        else:
          src = item.get_dir()
          patterns = [_basename(item)]
        
        env.install_files(target, src, patterns, env.out_dir() + "/" + env.out_prefix() + "/" + dst)
        
        collect_buildfiles(item, dst)
  
  if target is None:
    raise Exception("*** make_install: No files to install")
  
  del(keywords["install_files"])
  
  # Do post processing of the target [will create the deploy target]
  env._make_any_post(target, keywords)
  
  # Set the alias of each deploy file so get_alias works
  for s, d in keywords["build_files"].iteritems():
    aliases[abspath(s)] = keywords["alias"]
  
  return target

def make_program(env, **keywords):
  if not "app" in keywords:
    keywords["app"] = "shell"
  
  if not "sources" in keywords:
    raise Exception("Missing \"sources\" keyword argument")
  
  name, subdir = env._make_any_pre(keywords)
  
  if not "prefix" in keywords:
    prefix2 = "bin/%s/%s" % (env.platform(), env.arch())
  else:
    prefix2 = keywords["prefix"]
  
  prefix = env.out_prefix()
  
  appver = "all" if not "app_version" in keywords else keywords["app_version"]
  
  prg  = "%s/%s/%s/%s" % (env.out_dir(), prefix, appver, prefix2)
  prg += subdir
  prg += "/" + name
  
  build_prefix = keywords.get("build_prefix", "static")
  if sys.platform == "win32":
    build_prefix += "/msvc-%s" % env.compiler_ver()
  env["OBJDIR"] = env.obj_dir() + "/" + build_prefix

  SetRPath(env, keywords)

  target = env.Program(prg, env._collect_objects(keywords["sources"], _static_objects))
  
  keywords["build_files"] = {str(target[0]): "%s/%s/%s" % (appver, prefix2, subdir)}
  if env.generates_manifest() and env.keep_manifest():
    keywords["build_files"][str(target[0])+".manifest"] = keywords["build_files"][str(target[0])]
  
  env._make_any_post(target, keywords)
  
  # extra cleanup for windows
  if env.platform() == "windows":
    if env.generates_manifest() and not env.keep_manifest():
      manifest = (str(target[0])+'.manifest').replace("/", "\\")
      env.AddPostAction(target, "del /Q \"%s\"" % manifest)
    if env.build_debug():
      Clean(target, prg+'.ilk')
  
  return target

def make_static_library(env, **keywords):
  if not "app" in keywords:
    keywords["app"] = "lib"
  
  if not "sources" in keywords:
    raise Exception("Missing \"sources\" keyword argument")
  
  name, subdir = env._make_any_pre(keywords)
  
  if not "prefix" in keywords:
    prefix2 = "%s/%s" % (env.platform(), env.arch())
  else:
    prefix2 = keywords["prefix"]
  
  prefix = env.out_prefix()
  
  appver = "all" if not "app_version" in keywords else keywords["app_version"]
  
  lib  = "%s/%s/%s/lib/%s" % (env.out_dir(), prefix, appver, prefix2)
  lib += subdir
  lib += "/" + name
  
  if env.platform() == "linux":
    env.Append(CCFLAGS = " -fPIC")
  
  build_prefix = keywords.get("build_prefix", "static")
  if sys.platform == "win32":
    build_prefix += "/msvc-%s" % env.compiler_ver()
  env["OBJDIR"] = env.obj_dir() + "/" + build_prefix
  
  target = env.StaticLibrary(lib, env._collect_objects(keywords["sources"], _static_objects))
  
  keywords["build_files"] = {str(target[0]): "%s/lib/%s/%s" % (appver, prefix2, subdir)}
  
  env._make_any_post(target, keywords)
  
  global library_paths, library_names
  library_paths[keywords["alias"]] = os.path.dirname(lib)
  library_names[keywords["alias"]] = name
  
  return target

def make_shared_library(env, **keywords):
  if not "app" in keywords:
    keywords["app"] = "lib"
  
  if not "sources" in keywords:
    raise Exception("Missing \"sources\" keyword argument")
  
  name, subdir = env._make_any_pre(keywords)
  
  if not "prefix" in keywords:
    prefix2 = "%s/%s" % (env.platform(), env.arch())
  else:
    prefix2 = keywords["prefix"]
  
  prefix = env.out_prefix()
  
  appver = "all" if not "app_version" in keywords else keywords["app_version"]
  
  basepath = "%s/%s/%s" % (env.out_dir(), prefix, appver)
  
  if env.platform() == "windows":
    dll = basepath + "/bin/" + prefix2 + subdir + "/" + name
    lib = basepath + "/lib/" + prefix2 + subdir + "/" + name
    env.set_import_lib(lib)
    keywords["build_files"] = {lib+".lib": "%s/lib/%s/%s" % (appver, prefix2, subdir)}
  else:
    dll = basepath + "/lib/" + prefix2 + subdir + "/" + name
    lib = dll
    keywords["build_files"] = {}
  
  build_prefix = keywords.get("build_prefix", "shared")
  if sys.platform == "win32":
    build_prefix += "/msvc-%s" % env.compiler_ver()
  env["OBJDIR"] = env.obj_dir() + "/" + build_prefix

  SetRPath(env, keywords)

  if sys.platform != "win32":
    if sys.platform == "darwin":
      env.Append(LINKFLAGS=" -Wl,-install_name,@rpath/lib%s.dylib" % name)
    else:
      env.Append(LINKFLAGS=" -Wl,-soname,lib%s.so" % name)


  target = env.SharedLibrary(dll, env._collect_objects(keywords["sources"], _shared_objects))
  
  if env.platform() == "windows":
    keywords["build_files"][str(target[0])] = "%s/bin/%s/%s" % (appver, prefix2, subdir)
    if env.generates_manifest() and env.keep_manifest():
      keywords["build_files"][str(target[0])+".manifest"] = keywords["build_files"][str(target[0])]
  else:
    keywords["build_files"][str(target[0])] = "%s/lib/%s/%s" % (appver, prefix2, subdir)
  
  env._make_any_post(target, keywords)
  
  global library_paths, library_names
  library_paths[keywords["alias"]] = os.path.dirname(lib) #basepath + "/lib/%s" % prefix2
  library_names[keywords["alias"]] = name
  
  # extra cleanup for windows
  if env.platform() == "windows":
    files = [lib+'.lib', lib+'.exp']
    if env.generates_manifest() and not env.keep_manifest():
      #manifest = (dll+'.dll.manifest').replace("/", "\\")
      manifest = (str(target[0])+'.manifest').replace("/", "\\")
      env.AddPostAction(target, "del /Q \"%s\"" % manifest)
    if env.build_debug():
      files.append(dll+'.ilk')
    Clean(target, files)
  
  return target

def make_library(env, **keywords):
  if env.build_static():
    return env.make_static_library(**keywords)
  else:
    return env.make_shared_library(**keywords)

def make_module(env, **keywords):
  # "app" is undefined here
  
  if not "sources" in keywords:
    raise Exception("Missing \"sources\" keyword argument")
  
  name, subdir = env._make_any_pre(keywords)
  
  if not "prefix" in keywords:
    prefix2 = "%s/%s" % (env.platform(), env.arch())
  else:
    prefix2 = keywords["prefix"]
  
  prefix = env.out_prefix()
  
  mod  = "%s/%s/%s" % (env.out_dir(), prefix, prefix2)
  mod += subdir + "/" + name
  
  env.ignore_import_lib()
  env['SHLIBPREFIX'] = ""
  
  build_prefix = keywords.get("build_prefix", "shared")
  if sys.platform == "win32":
    build_prefix += "/msvc-%s" % env.compiler_ver()
  env["OBJDIR"] = env.obj_dir() + "/" + build_prefix

  SetRPath(env, keywords)

  target = env.SharedLibrary(mod, env._collect_objects(keywords["sources"], _shared_objects))
  
  keywords["build_files"] = {str(target[0]): "%s/%s" % (prefix2, subdir)}
  if env.generates_manifest() and env.keep_manifest():
    keywords["build_files"][str(target[0])+".manifest"] = keywords["build_files"][str(target[0])]
  
  env._make_any_post(target, keywords)
  
  # extra cleanup for windows
  if env.platform() == "windows":
    if env.generates_manifest() and not env.keep_manifest():
      manifest = (str(target[0])+'.manifest').replace("/", "\\")
      env.AddPostAction(target, "del /Q \"%s\"" % manifest)
    if env.build_debug():
      Clean(target, mod+'.ilk')
  else:
    env.Append(CCFLAGS = ["-fvisibility=hidden"])
  
  return target

def md5_file_signature(fname, chunksize=65536):
  m = hashlib.md5()
  f = open(fname, "rb")
  while 1:
    blck = f.read(chunksize)
    if not blck:
      break
    m.update(str(blck))
  f.close()
  return m.hexdigest()

def is_shell_script(path):
  with open(path, "rb") as f:
    l = f.read(2)
    if l == "#!":
      return True
  return False

TextFileExtensions = {".py": None,
                      ".mel": None,
                      ".mtd": None,
                      ".template": None,
                      ".env": None,
                      ".txt": None,
                      ".bat": None,
                      ".sh": None,
                      ".h": None,
                      ".hh": None,
                      ".hpp": None,
                      ".hxx": None,
                      ".H": None,
                      ".c": None,
                      ".cc": None,
                      ".cpp": None,
                      ".cxx": None,
                      ".C": None,
                      ".cs": None,
                      ".xml": None,
                      ".json": None,
                      ".yaml": None,
                      ".yml": None,
                      ".yml": None,
                      ".rb": None,
                      ".cg": None,
                      ".cginc": None,
                      ".shader": None,
                      ".glsl": None,
                      ".hlsl": None,
                      ".sl": None,
                      ".osl": None,
                      ".frag": None,
                      ".vert": None,
                      ".meta": None,
                      ".md": None,
                      ".sln": None,
                      ".suo": None,
                      ".vcxproj": None,
                      ".csproj": None,
                      ".ass": None,
                      ".ma": None,
                      "": is_shell_script,}

EOLs = set(["\r", "\n"])

ForceEOLs = {".bat" : "\r\n",
             ".sh"  : "\n",
             ".mtd" : "\n",
             ""     : "\n"}

def is_text_file(path):
  global TextFileExtensions

  _, ext = os.path.splitext(path)
  if ext in TextFileExtensions:
    cond = TextFileExtensions[ext]
    if cond:
      return cond(path)
    else:
      return True

  return False

def replace_eol_in_line(sline, eol=None):
  if eol is None:
    return sline
  else:
    # Do not add EOL if original didn't contain one
    # Preserve trailing whitespaces
    global EOLs
    # rstrip:
    # - 'aaaa   \r\n' -> 'aaaa'
    # - 'aaaa   '     -> 'aaaa'
    slen = len(sline)
    dline = sline.rstrip()
    dlen = len(dline)
    while dlen < slen and sline[dlen] not in EOLs:
      dline += sline[dlen]
      dlen += 1
    if dlen < slen:
      dline += eol
    return dline

def is_same_file(srcpath, dstpath):
  global TextFileExtensions
  
  if is_text_file(srcpath):
    # Note: python file.readlines with normalize lines endings to \n
    srclines = []
    with open(srcpath, "rb") as f:
      srclines = f.readlines()
    nsrclines = len(srclines)
    
    dstlines = []
    with open(dstpath, "rb") as f:
      dstlines = f.readlines()
    ndstlines = len(dstlines)
    
    if nsrclines != ndstlines:
      return False
    
    seol = ForceEOLs.get(os.path.splitext(srcpath)[1], None)
    if seol is None:
      # EOLs are not forced on file, normalize to LF in comparison
      seol = '\n'
      deol = '\n'
    else:
      # EOLs are forced on file, use designated EOL for source file and existing one for destination
      deol = None
    
    lineno = 0
    while lineno < nsrclines:
      # Only force EOL on source files so that files that should have EOL force to a certain
      # type will be tagged as changed
      if replace_eol_in_line(srclines[lineno], seol) != replace_eol_in_line(dstlines[lineno], deol):
        return False
      lineno += 1
    
    return True
  
  else:
    # Binary files
    return (md5_file_signature(srcpath) == md5_file_signature(dstpath))

def are_files_identical(srcpath, dstpath):
  if not os.path.exists(srcpath) or not os.path.exists(dstpath):
    return False
  
  elif os.path.isfile(srcpath) and os.path.isfile(dstpath):
    return is_same_file(srcpath, dstpath)
  
  elif os.path.isdir(srcpath) and os.path.isdir(dstpath):
    def check_recurse(srcdir, dstdir):
      for i in glob.glob(os.path.join(srcdir, "*")):
        bn = os.path.basename(i)
        j  = os.path.join(dstdir, bn)
        if not os.path.exists(j):
          return False
        if os.path.isdir(i):
          if not os.path.isdir(j):
            return False
          if not check_recurse(i, j):
            return False
        else:
          if not os.path.isfile(j):
            return False
          if not is_same_file(i, j):
            return False
      return True
    
    return check_recurse(srcpath, dstpath)
  
  else:
    raise Exception("are_files_identical: comparing files of different types: %s, %s" % (srcpath, dstpath))

def warn_overwrite_and_proceed(tfile):
  print("scons:")
  print("scons:     !!! Warning !!!")
  print("scons:")
  print("scons:     Deploying file: \"%s\"" % tfile)
  print("scons:")
  print("scons:     Trying to overwrite file with a different content.")
  print("scons:     You might have forgot to update the version number.")
  print("scons:     If not you should check that the changes don't break compatibility.")
  print("scons:")
  sys.stdout.write("scons:     Proceed anyway? [y/N/a] ")
  s = sys.stdin.readline().strip()
  rv = 0
  if s in ["N", "n", "", "No", "no", "NO"]:
    rv = -1
  elif s in ["A", "a", "Always", "always", "ALWAYS"]:
    rv = 1
  print("scons:")
  return rv

def prompt_deploy(target=None, source=None, env=None):
  #print("scons: Deploying files...")
  pass

def copy_single_file(srcpath, dstpath, backup=False):
  global ForceEOLs, EOLs

  if backup and os.path.isfile(dstpath):
    shutil.move(dstpath, dstpath + datetime.datetime.now().strftime(".%Y%m%d.%H%M%S"))

  if is_text_file(srcpath):
    _, ext = os.path.splitext(srcpath)
    eol = ForceEOLs.get(ext, None)
    if eol is not None:
      with open(srcpath, "rb") as src:
        with open(dstpath, "wb") as dst:
          for sline in src.readlines():
            dst.write(replace_eol_in_line(sline, eol))
    else:
      shutil.copyfile(srcpath, dstpath)
  else:
    shutil.copyfile(srcpath, dstpath)

  try:
    shutil.copymode(srcpath, dstpath)
  except:
    # IGNORE ERRORS
    pass


def deploy_func(target=None, source=None, env=None):
  if not "DEPLOY_SOURCES" in env or\
     not "DEPLOY_TARGETS" in env or\
     len(env["DEPLOY_SOURCES"]) != len(env["DEPLOY_TARGETS"]):
    raise Exception("Invalid deployment informations")
  
  if not env.deploy_dependencies():
    global nodeploy, aliases
    if get_alias(env, target) in nodeploy:
      #print("Do not deploy target \"%s\"" % get_alias(env, target))
      return 0
  
  tspairs = []
  alwaysow = False
  
  for t, s in zip(env["DEPLOY_TARGETS"], env["DEPLOY_SOURCES"]):
    sfile = str(s)
    tfile = str(t)
    if os.path.exists(tfile):
      if are_files_identical(sfile, tfile):
        print("scons:   Skip \"%s\"" % tfile)
        continue
      elif not alwaysow:
        ow = (1 if not env.warn_on_deploy() else warn_overwrite_and_proceed(tfile))
        if ow < 0:
          return 1
        elif ow == 1:
          alwaysow = True
        print("scons:   Deploy \"%s\"" % tfile)
    else:
      print("scons:   Deploy \"%s\"" % tfile)
    tspairs.append((t, s))
  
  print("scons:")
  
  for t, s in tspairs:
    sfile = str(s)
    tfile = str(t)
    tdir  = os.path.dirname(tfile)
    if not os.path.exists(tdir):
      os.makedirs(tdir)
    if os.path.isfile(sfile):
      copy_single_file(sfile, tfile, backup=env.backup_on_deploy())
    else:
      if env.backup_on_deploy() and os.path.isdir(tfile):
        shutil.move(tfile, tfile + datetime.datetime.now().strftime(".%Y%m%d.%H%M%S"))
      def copy_recurse(srcdir, dstdir):
        for i in glob.glob(os.path.join(srcdir, "*")):
          bn = os.path.basename(i)
          j  = os.path.join(dstdir, bn)
          if os.path.isdir(i):
            copy_recurse(i, j)
          else:
            try:
              os.makedirs(os.path.dirname(j))
            except:
              pass
            copy_single_file(i, j)
      copy_recurse(sfile, tfile)
    #st = os.stat(sfile)
    #os.chmod(tfile, stat.S_IMODE(st[stat.ST_MODE]) | stat.S_IWRITE)
  
  return 0

DeployAction = SCons.Action.Action(deploy_func, prompt_deploy)

def addOrReplaceVars(env, **kwargs):
  for varname, value in kwargs.iteritems():
    
    if not varname in env:
      print("No such variable: \"%s\"" % varname)
      continue
    
    for expr, by in value.iteritems():
      
      args = {}
      
      oldval = str(env[varname])
      
      m = re.search(expr, oldval)
      
      if m != None:
        args[varname] = oldval.replace(m.group(0), by)
        env.Replace(**args)
      
      else:
        args[varname] = by
        env.Append(**args)



def configure(**keywords):
  
  # SCONS COMMAND LINE ARGS
  #  debug=1|0
  #  dependency-dir=
  #  output-dir=
  #  static=1|0  build static library wherever possible
  #  x64=1|0     64 bit build
  #  <prjname>-dir=
  
  # Windows manifest
  keep_manifest = (int(ARGUMENTS.get("keep-manifest", "0")) == 1)
  
  # Debug info (windows only)
  debug_info = (int(ARGUMENTS.get("debug-info", "0")) == 1)
  
  # Debug on/off
  debug = (int(ARGUMENTS.get('debug', 0)) != 0)
  subdir = ""
  if debug:
    subdir = "/debug"
  else:
    subdir = "/release"
  
  x64 = ARGUMENTS.get('x64', None)
  if x64 is None:
    x86 = ARGUMENTS.get('x86', None)
    if x86 is None:
      x64 = 0 if pyplatform.architecture()[0] == "32bit" else 1
    else:
      x64 = (int(x86) == 0)
  else:
    x64 = (int(x64) != 0)
  arch = ""
  if x64:
    arch = "x64"
  else:
    arch = "x86"
  archdir = "/" + arch
  
  static = (int(ARGUMENTS.get('static', 0)) != 0)
  doDeploy = (int(ARGUMENTS.get('deploy', 0)) != 0)
  deployDeps = (int(ARGUMENTS.get('deploy-dependencies', 0)) != 0)
  deployBackup = (int(ARGUMENTS.get('backup', 1)) != 0)
  deployWarn = (int(ARGUMENTS.get('deploy-warn', 1)) != 0)
  warnLevel = ARGUMENTS.get("warn-level", "std")
  warnAsErr = (int(ARGUMENTS.get("warnings-as-errors", 0)) != 0)
  
  # Make all ARGUMENTS path absolute
  ARGUMENTS['dependency-dir'] = abspath(ARGUMENTS.get('dependency-dir', './dependencies/%s' % sys.platform))
  ARGUMENTS['output-dir'] = abspath(ARGUMENTS.get('output-dir', '.'))
  
  platform = "unknown"
  if str(Platform()) == "win32":
    platform = "windows"
  elif str(Platform()) == "darwin":
    platform = "osx"
  else:
    platform = "linux"
  
  # Directory setup
  top_dir    = abspath('.')
  build_dir  = top_dir + '/.build/%s/%s' % (platform, arch) + subdir
  out_dir    = ARGUMENTS.get('output-dir') + subdir
  deps_dir   = ARGUMENTS.get('dependency-dir')
  
  # MSVS_VERSION need to be set from the begining !
  compiler_ver = 0
  
  if platform == "windows":
    vcvars = ARGUMENTS.get("vcvars", os.environ.get("MSVC_USE_SCRIPT", ""))
    if "MSVS_VERSION" in keywords:
      msvs_version = keywords["MSVS_VERSION"]
    else:
      msvs_version = ARGUMENTS.get("mscver", None)
      if msvs_version is None:
        msvs_version = ARGUMENTS.get("MSVS_VERSION", os.environ.get("MSVC_DEFAULT_VERSION", "10.0"))
    msvs_arch = "amd64" if arch == "x64" else "x86"
    compiler_ver = float(msvs_version)
    if not vcvars or not os.path.isfile(vcvars):
      env = Environment(MSVC_VERSION = msvs_version, # Starting SCons 1.3, should use MSVC_VERSION
                        MSVS_VERSION = msvs_version,
                        MSVS_ARCH    = msvs_arch,
                        TARGET_ARCH  = msvs_arch, # Scons 1.3 seems to be looking for this one and not MSVS_ARCH...
                        LIBPATH      = [deps_dir+'/lib'])
    else:
      if (" " in vcvars or "\t" in vcvars) and not vcvars.startswith('"'):
        vcvars = "\"%s\"" % vcvars
      # Too bad this doesn't work
      #vcvars += " %s -vcvars_ver=%s" % (msvsarch, mscver)
      env = Environment(MSVC_VERSION    = msvs_version,
                        TARGET_ARCH     = msvs_arch,
                        MSVC_USE_SCRIPT = vcvars,
                        LIBPATH         = [deps_dir+'/lib'])
    # in SCons 1.2, there's a little issue with INCLUDE and LIB for msvc tool
    if "INCLUDE" in os.environ:
      env.Append(CPPPATH = os.environ["INCLUDE"].split(";"))
    if "LIB" in os.environ:
      env.Append(LIBPATH = os.environ["LIB"].split(";"))
    # Visual Studio C compiler above 7.1 uses a manifest file... really annoying
    if compiler_ver > 7.1:
      if compiler_ver < 10 and not keep_manifest:
        env['LINKCOM'] = [env['LINKCOM'], 'mt.exe -nologo -manifest ${TARGET}.manifest -outputresource:$TARGET;1']
        env['SHLINKCOM'] = [env['SHLINKCOM'], 'mt.exe -nologo -manifest ${TARGET}.manifest -outputresource:$TARGET;2']
      env.Append(CPPDEFINES=['_CRT_SECURE_NO_DEPRECATE', '_SCL_SECURE_NO_DEPRECATE'])
  
  else:
    env = Environment(LIBPATH  = [deps_dir+'/lib'])
    if sys.platform.startswith("linux"):
      gccroot = ARGUMENTS.get("gcc-root", None)
      if gccroot is not None and os.path.isdir(gccroot + "/usr/bin"):
        for n, k in (("gcc", "CC"), ("g++", "CXX"), ("ld", "SHLINK"), ("ar", "AR"), ("ranlib", "RANLIB")):
          if not k in env:
            continue
          com = gccroot + "/usr/bin/" + n
          if os.path.isfile(com):
            env[k] = com
  
  env['IMPLIBFLAGS']     = ''
  env['NOIMPLIBFLAGS']   = ''
  env['OBJDIR']          = build_dir
  env['OUT_PREFIX']      = None
  
  # add the base usefull functions
  class newenvclass(env.__class__):
    pass
  
  setattr(newenvclass, "ignore_import_lib", ignore_import_lib)
  setattr(newenvclass, "set_import_lib", set_import_lib)
  setattr(newenvclass, "no_console", no_console)
  setattr(newenvclass, "add_lib_path", add_lib_path)
  setattr(newenvclass, "add_include_path", add_include_path)
  setattr(newenvclass, "define", define)
  setattr(newenvclass, "top_dir", lambda env: top_dir)
  setattr(newenvclass, "out_dir", lambda env: out_dir)
  setattr(newenvclass, "out_prefix", lambda env: env["OUT_PREFIX"])
  setattr(newenvclass, "build_dir", lambda env: build_dir)
  setattr(newenvclass, "deps_dir", lambda env: deps_dir)
  setattr(newenvclass, "obj_dir", lambda env: env['OBJDIR'])
  setattr(newenvclass, "build_static", lambda env: static)
  setattr(newenvclass, "build_debug", lambda env: debug)
  setattr(newenvclass, "build_64", lambda env: x64)
  setattr(newenvclass, "compiler_ver", lambda env: compiler_ver)
  setattr(newenvclass, "platform", lambda env: platform)
  setattr(newenvclass, "arch", lambda env: arch)
  setattr(newenvclass, "make_program", make_program)
  setattr(newenvclass, "make_shared_library", make_shared_library)
  setattr(newenvclass, "make_static_library", make_static_library)
  setattr(newenvclass, "make_library", make_library)
  setattr(newenvclass, "make_module", make_module)
  setattr(newenvclass, "make_install", make_install)
  setattr(newenvclass, "depends", depends)
  setattr(newenvclass, "link", link)
  setattr(newenvclass, "splitname", lambda env,n: splitname(n))
  setattr(newenvclass, "abspath", lambda env,p: abspath(p))
  setattr(newenvclass, "_make_any_pre", _make_any_pre)
  setattr(newenvclass, "_make_any_post", _make_any_post)
  setattr(newenvclass, "_cleanup", _cleanup)
  setattr(newenvclass, "_shared_objects", _shared_objects)
  setattr(newenvclass, "_static_objects", _static_objects)
  setattr(newenvclass, "_collect_objects", _collect_objects)
  setattr(newenvclass, "generates_manifest", generates_manifest)
  setattr(newenvclass, "install_headers", install_headers)
  setattr(newenvclass, "install_files", install_files)
  setattr(newenvclass, "do_deploy", lambda env: doDeploy)
  setattr(newenvclass, "deploy_dependencies", lambda env: deployDeps)
  setattr(newenvclass, "backup_on_deploy", lambda env: deployBackup)
  setattr(newenvclass, "warn_on_deploy", lambda env: deployWarn)
  setattr(newenvclass, "add_or_replace", addOrReplaceVars)
  setattr(newenvclass, "keep_manifest", lambda env: keep_manifest)
  env.__class__ = newenvclass
  
  # load extensions build setups
  thisdir = abspath(os.path.dirname(__file__))
  for f in glob.glob(thisdir+'/exts/*.py'):
    extname = os.path.splitext(os.path.basename(f))[0]
    if extname != "__init__":
      __import__("sconsutils.exts.%s" % extname)
      configure_ext = eval("exts.%s.configure_ext" % extname)
      configure_ext(env, deps_dir)
    
  # Platform specific environment settings
  if platform == "windows":
    
    env['IMPLIBFLAGS'] = ' -implib:$IMPLIB$LIBSUFFIX'
    env['NOIMPLIBFLAGS'] = ' -implib:$OBJDIR/dummy.lib'
    env.Append(CCFLAGS = ' -GR -EHsc') # -FD -Fd$OBJDIR/vc.pdb')
    env.Append(CPPDEFINES = ['WIN32', '_WIN32', '_CONSOLE', '_MBCS'])
    
    if warnLevel == "none":
      env.Append(CCFLAGS = ' -w')
    elif warnLevel == "least":
      env.Append(CCFLAGS = ' -W1')
    elif warnLevel == "std":
      env.Append(CCFLAGS = ' -W2')
    elif warnLevel == "most":
      env.Append(CCFLAGS = ' -W3')
    elif warnLevel == "all":
      env.Append(CCFLAGS = ' -Wall')
    
    if warnAsErr:
      env.Append(CCFLAGS = ' -WX')
    
    if not debug:
      env.Append(CPPDEFINES = 'NDEBUG')
      if debug_info:
        env.Append(CCFLAGS = ' -Od -MD -Gm -Zi')
        env.Append(LINKFLAGS = ' -release -incremental -opt:noref -opt:noicf -pdb:$OBJDIR/vc.pdb')
      else:
        env.Append(CCFLAGS = ' -O2 -MD')
        env.Append(LINKFLAGS = ' -release -opt:ref -opt:icf -incremental:no')
    else:
      env.Append(CCFLAGS = ' -MDd -Gm -Zi')
      env.Append(CPPDEFINES = '_DEBUG')
      env.Append(LINKFLAGS = ' -debug -incremental -pdb:$OBJDIR/vc.pdb')
  else:
    if platform == "OSX":
      env.Append(CCFLAGS = ' -pipe -flat_namespace -fno-common -Wno-ctor-dtor-privacy')
    else:
      env.Append(CCFLAGS = ' -pipe -fno-common -Wno-ctor-dtor-privacy')
    
    if warnLevel == "none":
      env.Append(CCFLAGS = ' -w')
    elif warnLevel == "least":
      env.Append(CCFLAGS = ' -W')
    elif warnLevel == "std":
      env.Append(CCFLAGS = ' -W -Wunused')
    elif warnLevel == "most":
      env.Append(CCFLAGS = ' -W -Wall')
    elif warnLevel == "all":
      env.Append(CCFLAGS = ' -W -Wall -pedantic')
    
    if warnAsErr:
      env.Append(CCFLAGS = ' -Werror')
    
    if not debug:
      env.Append(CCFLAGS = ' -O2')
      env.Append(CPPDEFINES = 'NDEBUG')
      if platform == "OSX":
        env.Append(LINKFLAGS = ' -Wl,-dead_strip')
    else:
      env.Append(CCFLAGS = ' -O0 -g -ggdb')
      env.Append(CPPDEFINES = '_DEBUG')
  
  return env

