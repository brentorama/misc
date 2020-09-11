abcFile = maya.cmds.file("/marza/proj/spice/work/s0600/060/effect/everyone/bullet/cache/s0600_060_BulletBoyMuzzle_v2.abc", i=True, type="mzAlembic", rnn=True )
transforms = filter(lambda x: maya.cmds.nodeType(x) == "transform", abcFile)
subs = filter(lambda x: "loopB" in x, transforms)
pare = transforms[0].split("|")[1]
obs = maya.cmds.listRelatives(pare, c=True)

for one in obs:
    cond = maya.cmds.createNode("condition", n="%scond" % one, ss=True)
    clamp = maya.cmds.createNode("clamp", n= "%sClamp" % one)
    maya.cmds.connectAttr("%s.s" % one, "%s.input" % clamp)
    maya.cmds.setAttr("%s.maxR" % clamp, 1000)
    maya.cmds.setAttr("%s.minR" % clamp, 0.001)
    maya.cmds.connectAttr("%s.outputR" % clamp, "%s.firstTerm" % cond)
    maya.cmds.connectAttr("%s.outColorR" % cond, "%s.v" % one)
    maya.cmds.setAttr("%s.operation" % cond, 0)
    maya.cmds.setAttr("%s.secondTerm" % cond, 0.001)
    
maya.cmds.select(subs) 
texDef = maya.cmds.textureDeformer()
maya.cmds.setAttr("%s.pointSpace", 1)
maya.cmds.setAttr("%s.direction", 0)
maya.cmds.createnode("volumeNoise")
    

    