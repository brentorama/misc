import maya.cmds
import os

def CleanupSomeBullshit():
    username = os.environ.get("USER", os.environ.get("USERNAME", "")).capitalize()
    shit = maya.cmds.ls("*__UNKNOWN_REF_*")
    if len(shit):
        for one in shit:
            print("Removing %s") % one
            try:
                maya.cmds.delete(one)
            except:
                print ("Could not delete %s" % one)
    elif not len(shit):
        print ("There is no bullshit of that type in this scene, %s" % username)
                
CleanupSomeBullshit()