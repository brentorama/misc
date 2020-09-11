from SCons.Script import *
from sconsutils import deps
import os.path

def require_glm(env, ver=None):

  repdir = ""
  if env.platform() == "windows":
    repdir = "z:/marza/team/rnd/libs"
  else:
    repdir = "/marza/team/rnd/libs"

  outdir = ARGUMENTS.get('dependency-dir')
  check = outdir+"/include/glm/glm.hpp"

  if not os.path.exists(check):
    deps.fetch(repdir, outdir, ["glm-%s" % ver if ver else "glm"])
  env.Append(CPPPATH    = [outdir+"/include"])


def configure_ext(env, deps_dir):
  class new(env.__class__):
    pass
  setattr(new, "require_glm", require_glm)
  env.__class__ = new

