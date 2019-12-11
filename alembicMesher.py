import maya.cmds as cmd

def exportToAlembic():
    gp = cmd.ls(sl=True)
    if len(gp) is not 1:
        cmd.error('You must select only a "GEO_GP" group node')
    else:
        #initialize
        name = cmd.getAttr('%s.name' % gp[0])
        subObjects = cmd.listRelatives(gp , allDescendents = True, noIntermediate= True, type = 'mesh')
        count = len(subObjects)
        
        #build the temporary mesh switcher
        choice = cmd.shadingNode('choice', asUtility = True, name = 'mesher')  
        for i in range(count):
            cmd.connectAttr('%s.worldMesh[0]' % subObjects[i], '%s.input[%d]' %(choice, i), force = True)
            cmd.setKeyframe('%s.selector' % choice, time = i+1, value = i)
        outMesh = cmd.createNode('transform', name = 'outputMesh')
        outShape = cmd.createNode('mesh', name = '%sShape' % outMesh, parent = outMesh)
        cmd.connectAttr('%s.output' % choice, '%s.inMesh' % outShape)
        curDir = os.path.split(cmd.file(q = True, sn = True))[0]
        outFile = os.path.join(curDir, name)
        
        #This is MARZA exclusive
        cmd.mzAbcExport(j = "-fr 1.000000 %d.000000 -s 1.000000 -root %s -atp ABC_ -df Ogawa -file %s.abc" % (count, outMesh, outFile))
        
        #delete the trash
        for theShit in (choice, outMesh):
            cmd.delete(theShit)

exportToAlembic()