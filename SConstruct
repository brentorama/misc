import sconsutils
import sconsutils.exts.maya

mayaver = ARGUMENTS.get("mayaver", "2016")
sconsutils.exts.maya.setup_mscver(mayaver)
ver = "0.0.1"
env = sconsutils.configure()

env.make_maya_plugin(name="misc",
                     tool="misc",
                     version=ver,
                     maya_ver=mayaver,
                     sources=["src/*.cpp"],
                     install_files={"python/*": "all/python/",
                                    "maya/*": "all/maya/",
                                    "data/*": "all/data/",
                                    "release.txt": "../all/all",
                                    "*.md": "../all/all"},
                     template="misc.template")
