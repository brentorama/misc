def makeSurfaceShader():
    import maya.cmds as cmd
    obj = cmds.ls(sl=True)
    var = ['.outColor','.outTransparency','surfaceShader','']
    shader = cmd.shadingNode(var[2], asShader=True)
    proj = cmd.shadingNode('projection', asTexture=True)
    fileName = cmd.shadingNode('file', asTexture=True)
    cmd.connectAttr(fileName+var[0], proj+'.image')
    cmd.connectAttr(fileName+var[1], proj+'.transparency')
    for i in [0, 1]:
		cmd.connectAttr(proj+var[i], shader+var[i])
    cmd.setAttr(proj+'.projType', 8)
    basicFilter = '*.jpg *.png'
    dialog = cmds.fileDialog2(fileFilter=basicFilter, fm=1, dialogStyle=0)
    cmds.setAttr(fileName+'.fileTextureName', dialog[0], type='string')
    cmds.setAttr (fileName+'.useFrameExtension', 1)
    cmds.sets(renderable=True, noSurfaceShader=True, empty=True, name=shader+'SG')
    cmds.connectAttr(shader+var[0], shader+'SG.'+var[2])
    cmds.select(obj[0])
    cmds.sets(e=True, forceElement = shader+'SG')
    cmds.select(proj)

makeSurfaceShader()


