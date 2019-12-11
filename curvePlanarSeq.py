import maya.cmds as cmd

def curvePlanarSeq():
    name = 'splC'
    maxShapes = 1
    gp = cmd.ls(sl = True)
    shapes = []
    choiceNodes = []
    if len(gp) is not 1:
        print('You must select only one group node')
        return
    else:
        mainShapes = cmd.listRelatives(gp, children = True,  type = 'transform')
        numShapes = len(mainShapes)
        plugs = makeAsset(name, numShapes)
        ctlObj = plugs[0]
        setupGp = plugs[1]
        renderGp = plugs[2]
        
        #create the library and rename the objects, meanwhile find the max shapes
        for i in range(numShapes):
            subShapes = None
            mainShapeName = '%s%02d_CRV' %(name, i+1)
            subObjects = cmd.listRelatives(mainShapes[i], children = True, type = 'transform')
            if subObjects: 
                subShapes = []
                numSubs = len(subObjects)
                if ((numSubs + 1) > maxShapes):  maxShapes = (numSubs + 1) 
                for n in range(numSubs):
                    subShapeName = '%s%02d_%02d_subCRV'  % (name, i+1, n+1)
                    newSubshape = cmd.rename(subObjects[n], subShapeName)
                    subShapes.append(newSubshape)                          
            shapes.append([mainShapeName, subShapes])
            cmd.rename(mainShapes[i], mainShapeName)
            
        #create the required number of chioce nodes (as many as the maximum number of curves per drawing)    
        for i in range(maxShapes):
            newNode = cmd.shadingNode('choice', asUtility = True, name = '%s_choice_%02d' %(name, i+1))
            cmd.connectAttr('%s.frame' % ctlObj, '%.selector' % newNode)
            choiceNodes.append(newNode)
            
        #now connect the various additional shapes to their corresponding choice nodes
        for i in range(numShapes):
            cmd.connectAttr('%sShape.worldSpace[0]' % shapes[i][0], '%s.input[%d]' % (choiceNodes[0], i))
            if shapes[i][1] is not None:
                for sub in range(len(shapes[i][1])):
                    cmd.connectAttr('%sShape.worldSpace[0]' % shapes[i][1][sub], '%s.input[%d]' % (choiceNodes[sub+1], i))       
        

def makeAsset(name = '', numShapes=100):
    nodes = []
    root = cmd.group(em = True, name = 'root')
    for one in ['anim', 'setup', 'render']:
        node = cmd.group(p = root, em = True, name = '%s_GP' % (one))
        nodes.append(node)
    ctlGP = cmd.group(em = True, p = nodes[0], name = '%s_CTL_GP' %name)     
    CTL = cmd.circle(nr= (0, 1, 0), name = '%s_CTL' % name)
    cmd.addAttr(CTL, k = True, ln= 'frame', at = 'long', min = 0, max = numShapes, dv = 0)
    cmd.addAttr(CTL, k = True, ln= 'flip', at = 'long', min = 0, max = 1, dv = 0)
    cmd.addAttr(CTL, k = True, ln= 'resMin', at = 'long', min = 2, max = 5000, dv = 2)
    cmd.addAttr(CTL, k = True, ln= 'resMax', at = 'long', min = 2, max = 5000, dv = 2)
    cmd.parent(CTL[0], ctlGP)
    lib = {'guts':1,'meshDisplay':2}
    for key, val in lib.iteritems() :
        cmd.addAttr(ctlGP, k = True, ln= key, at = 'long', min = 0, max = val, dv = 0)
    cmd.connectAttr('%s.guts' % ctlGP, '%s.%s' % (nodes[1], 'v'))
    for i in ['overrideEnabled', 'overrideDisplayType']:
        cmd.connectAttr('%s.meshDisplay' % ctlGP, '%s.%s' % (nodes[2], i))
	cmd.setAttr('%s.meshDisplay' % ctlGP, 2)
	return [CTL[0], nodes[1], nodes[2]]
	

curvePlanarSeq()
