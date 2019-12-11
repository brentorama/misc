import maya.cmds as cmd

def connectToMesher(name = 'object'):
    gp = cmd.ls(sl=True)
    if len(gp) is not 1:
        cmd.error('You must select only a "GEO_GP" group node')
    else:
        subObjects = cmd.listRelatives(gp , allDescendents = True, noIntermediate= True, type = 'mesh')        
        count = len(subObjects)                  
        choice = cmd.shadingNode('choice', asUtility = True, name = '%s_mesher' %name)  
        for i in range(count):
            cmd.connectAttr('%s.worldMesh[0]' % subObjects[i], '%s.input[%d]' %(choice, i), force = True)
            cmd.setKeyframe('%s.selector' % choice, time = i+1, value = i)
        outMesh = cmd.createNode('transform', name = '%s_mesh' % name)
        outShape = cmd.createNode('mesh', name = '%sShape' % outMesh, parent = outMesh)
        cmd.connectAttr('%s.output' % choice, '%s.inMesh' % outShape)
        cmd.selectKey('%s_selector' % choice, k = True)
        cmd.setInfinity(pri = 'cycle', poi = 'cycle')
        obs = cmd.listRelatives(gp, type = 'transform')
        for one in range(1, count):
            cmd.parent(subObjects[one], obs[0], r = True, s = True) 
            cmd.delete(obs[one])
        for one in [outMesh, obs[0]]  :
			cmd.parent(one, world = True)
		cmd.rename(obs[0], '%s_shapes' % name)		

connectToMesher('geyserB')