from SCons.Script import *
import sconsutils
from sconsutils import deps
import os.path


def require_wx(env, ver=None):
  if env.platform() == "windows":
    outdir = ARGUMENTS.get('dependency-dir')
    repdir = "z:/marza/team/rnd/libs"
    check  = outdir+"/include/wx/wx.h"
    if not os.path.exists(check):
      deps.fetch(repdir, outdir, ["wx-%s" % ver if ver else "wx"])
  env.Append(CFLAGS     = env["WX_CFLAGS"])
  env.Append(CPPDEFINES = env["WX_CPPDEFINES"])
  env.Append(CPPPATH    = env["WX_CPPPATH"])
  env.Append(LINKFLAGS  = env["WX_LINKFLAGS"])
  env.Append(LIBPATH    = env["WX_LIBPATH"])
  env.Append(LIBS       = env["WX_LIBS"])


def configure_ext(env, deps_dir):
  env["WX_CFLAGS"] = ""
  env["WX_CPPDEFINES"] = []
  env["WX_CPPPATH"] = []
  env["WX_LINKFLAGS"] = ""
  env["WX_LIBPATH"] = []
  env["WX_LIBS"] = []
  
  if env.platform() == "linux":
    env["WX_CFLAGS"] = " -D_FILE_OFFSET_BITS=64"
    env["WX_CPPDEFINES"] = ["_LARGE_FILES", "__WXGTK__"]
    env["WX_CPPPATH"] = ["/usr/lib64/wx/include/gtk2-unicode-release-2.8",
                         "/usr/include/wx-2.8"]
    env["WX_LINKFLAGS"] = " -pthread"
    env["WX_LIBPATH"] = ["/usr/lib64"]
    env["WX_LIBS"] = ["wx_baseu-2.8",
                      "wx_baseu_net-2.8",
                      "wx_baseu_xml-2.8",
                      "wx_gtk2u_adv-2.8",
                      "wx_gtk2u_aui-2.8",
                      "wx_gtk2u_core-2.8",
                      "wx_gtk2u_html-2.8",
                      "wx_gtk2u_qa-2.8",
                      "wx_gtk2u_richtext-2.8",
                      "wx_gtk2u_xrc-2.8",
                      "wx_gtk2u_gl-2.8"]
  
  elif env.platform() == "osx":
    env["WX_CFLAGS"] = " -D_FILE_OFFSET_BITS=64"
    env["WX_CPPDEFINES"] = ["_LARGE_FILES", "__WXMAC__"]
    env["WX_CPPPATH"] = ["/opt/local//lib/wx/include/mac-unicode-release-2.8",
                         "/opt/local/include/wx-2.8"]
    env["WX_LINKFLAGS"] = " -framework IOKit -framework Carbon -framework Cocoa -framework System -framework QuickTime -framework OpenGL -framework AGL"
    env["WX_LIBPATH"] = ["/opt/local/lib"]
    env["WX_LIBS"] = ["wx_macu_gizmos-2.8",
                      "wx_macu_gizmos_xrc-2.8",
                      "wx_macu_gl-2.8",
                      "wx_macu_stc-2.8",
                      "wx_macu-2.8"]
  
  else:
    env["WX_CFLAGS"] = ""
    env["WX_CPPDEFINES"] = ["WXUSINGDLL", "__WXMSW__", "NOPCH", "UNICODE", "_UNICODE"]
    env["WX_CPPPATH"] = [deps_dir+"/include",
                         deps_dir+"/lib/"+env.arch()+"/msvc",
                         deps_dir+"/lib/"+env.arch()+"/mswu"]
    env["WX_LINKFLAGS"] = ""
    env["WX_LIBPATH"] = []
    env["WX_LIBS"] = ["wxbase28u",
                      "wxbase28u_net",
                      "wxbase28u_xml",
                      "wxmsw28u_adv",
                      "wxmsw28u_aui",
                      "wxmsw28u_core",
                      "wxmsw28u_html",
                      "wxmsw28u_media",
                      "wxmsw28u_qa",
                      "wxmsw28u_richtext",
                      "wxmsw28u_xrc",
                      "wxmsw28u_gl"]
  
  class new(env.__class__):
    pass
  setattr(new, "require_wx", require_wx)
  env.__class__ = new


