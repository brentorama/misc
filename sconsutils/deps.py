import re
import sys
import shutil
import os
import os.path
import glob
import tarfile

def extract_library_package(repdir, outdir, name, ver=None, date=None):
  
  if ver and date:
    print("*** You cannot specify both version and date")
    return False
  
  if ver:
    exp = re.compile("^%s\[%s\]\.tgz$" % (name, ver.replace(".", "\\.")))
  elif date:
    exp = re.compile("^%s\[%s\]\.tgz$" % (name, date))
  else:
    exp = re.compile("^%s(\[.*\])?\.tgz$" % name)
  
  matching = []
  package = None
  
  plat = ("windows" if sys.platform == "win32" else "linux")
  for sub in (plat, "common", ""):
    for f in glob.glob(repdir+"/"+sub+"/*.tgz"):
      if exp.match(os.path.basename(f)):
        matching.append(f)
  
  if len(matching) == 0:
    print("*** Could not find library package.")
    return False
  
  if len(matching) > 1:
    print("Several package found:")
    for m in matching:
      print(m)
    
    print("The latest version will be used. Please specify package version or date to override this behaviour")
    
    exp = re.compile("%s\[([^]]*)\]\.tgz$" % name)
    m = exp.search(matching[0])
    latest = matching[0]
    vspl0 = map(lambda x: int(x), m.group(1).split("."))
    i = 1
    while i < len(matching):
      m = exp.search(matching[i])
      vspl1 = map(lambda x: int(x), m.group(1).split("."))
      j = 0
      skiptonext = False
      while j < min(len(vspl0), len(vspl1)):
        if vspl0[j] > vspl1[j]:
          # keep it
          skiptonext = True
          break
        elif vspl0[j] < vspl1[j]:
          # replace it
          skiptonext = True
          vspl0 = vspl1
          latest = matching[i]
          break
        j += 1
      if skiptonext == False and len(vspl0) < len(vspl1):
        # remaining numbers of vspl0 are considered 0
        # any version number is above or equal to 0
        vspl0 = vspl1
        latest = matching[i]
      i += 1
    
    matching = [latest]
    print("=> %s" % latest)
  
  package = matching[0]
  print("=== Extract library package: %s..." % package)
  cwd = os.getcwd()
  tmp = os.path.join(outdir, "__tmp__.tgz")
  shutil.copyfile(package, tmp)
  tar = tarfile.open(tmp, "r:gz")
  fi = tar.next()
  while fi:
    tar.extract(fi, outdir)
    fi = tar.next()
  tar.close()
  os.remove(tmp)
  
  return True


def has(repdir, package):
  if not os.path.isdir(repdir):
    return False
  
  m = re.match("^(.*)\-(.*)$", package)
  if m:
    name = m.group(1)
    dorv = m.group(2)
    m = re.match("^(\d\d)(\d\d)(\d\d)$", dorv)
    if m:
      date = m.group(1)+"-"+m.group(2)+"-"+m.group(3)
      exp = re.compile("%s\[%s\]\.tgz$" % (name, date))
    else:
      exp = re.compile("%s\[%s\]\.tgz$" % (name, dorv.replace(".", "\\.")))
  else:
    exp = re.compile("%s(\[.*\])?\.tgz$" % name)
    
  matching = []
  package = None
  
  plat = ("windows" if sys.platform == "win32" else "linux")
  for sub in (plat, "common", ""):
    for f in glob.glob(repdir+"/"+sub+"/*.tgz"):
      if exp.search(os.path.basename(f)):
        matching.append(f)
  
  return (len(matching) > 0)


def fetch(repdir, outdir, packages):
  
  if not os.path.isdir(repdir):
    print("*** Repository directory \"%s\" doesn't exist." % repdir)
    return False
  
  if not os.path.exists(outdir):
    try:
      os.makedirs(outdir)
    except:
      pass
  
  if not os.path.isdir(outdir):
    print("*** Invalid output directory \"%s\"." % outdir)
    return False

  for package in packages:
    print("=== Fetch %s" % package)
    m = re.match("^(.*)\-(.*)$", package)
    if m:
      name = m.group(1)
      dorv = m.group(2)
      m = re.match("^(\d\d)(\d\d)(\d\d)$", dorv)
      if m:
        date = m.group(1)+"-"+m.group(2)+"-"+m.group(3)
        if not extract_library_package(repdir, outdir, name, None, date):
          return False
      else:
        if not extract_library_package(repdir, outdir, name, dorv, None):
          return False
    else:
      if not extract_library_package(repdir, outdir, package):
        return False

  return True


if __name__ == "__main__":
  
  import getopt
  import sys
  
  def usage():
    print("python deps.py [-r <path>/--repository=<path>] [-o <path>/--output=<path>] <package_name>*")
  
  try:
    opts, args = getopt.getopt(sys.argv[1:], "r:o:h",
                               ["repository=", "output=", "help"])
  except getopt.GetoptError:
    usage()
  
  repos = "/marza/team/rnd/libs"
  if sys.platform == "win32":
    repos = "z:" + repos
  output = "./dependencies"
  
  for o, a in opts:
    if o in ("-r", "--repository"):
      repos = a
    if o in ("-o", "--output"):
      output = a
    if o in ("-h", "--help"):
      usage()
      sys.exit()
  
  if len(args) > 0:
    fetch(repos, output, args)
  else:
    usage()
  
