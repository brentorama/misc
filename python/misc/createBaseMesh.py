import maya.cmds as cmd
import maya.mel as mel

def createBaseMesh():    
    ob = cmd.ls(sl=True)[0]
    if (cmd.nodeType(ob) == 'transform') and (cmd.attributeQuery('name', node = ob, exists = True)): 
                   
        #initialize
        merge = True
        name = cmd.getAttr('%s.name' % ob)        
        frames = cmd.getAttr('%s.count' % ob)
        ctlObj = cmd.getAttr('%s.myCtl' % ob)
        thresh = 0.015
        extrudeAmt = 0.2
        edgeAmt = 0.05
        newGp = cmd.group(em = True, w = True, n='%s_GEO_GP' % name)
        cmd.addAttr(newGp, ln = 'name', dt = 'string') 
        cmd.setAttr("%s.name" % newGp, name, type = 'string') 
        
        #create the new objects       
        for i in range(1,frames +1):
            cmd.setAttr('%s.frame' % ctlObj, i)
            newName = '%s_%02d_GEO' % (name, i)
            newOb = cmd.duplicate(ob, n = newName)[0]
            cmd.setAttr('%s.v' % newOb, 0)
            #insert a handler here to detect double faces or bad geo
            if merge: 
                cmd.polyMergeVertex(newOb, ch = 1, d = thresh)
            selectBorderEdges(newOb)
            cmd.polyExtrudeEdge(ch=1, d =2, lty = edgeAmt)
            cmd.polyExtrudeFacet(newOb, ch=1, kft = True, ltz =extrudeAmt, d = 2)
            cmd.select(newOb)
            mel.eval('polyCleanupArgList 4 { "0","1","1","0","1","0","0","0","0","1e-005","0","1e-005","0","1e-005","0","-1","0","0"}')
            cmd.polySoftEdge(newOb, ch=1, a= 180)
            cmd.parent(newOb, newGp)
            cmd.setKeyframe('%s.v' % newOb, t = [i-1, i+1], v = 0)
            cmd.setKeyframe('%s.v' % newOb, t = i, v= 1)
            for xyz in ['x','y','z']:
                cmd.setAttr('%s.t%s' % (newOb, xyz), 0)
            cmd.delete(newOb, ch = True)
            shit = cmd.ls('*%s*' % newName, io = True, type = 'mesh')
            if shit:
                cmd.delete(shit)

            #check for non-manifold and fix  
            if (cmds.polyInfo(newOb, nme=True, nmv = True, nue = True, nuv = True)):
                print('%s had nonmanifold Geo, attempting fix...' % newOb)
                mel.eval('polyCleanupArgList 4 { "0","1","0","0","0","0","0","0","0","1e-005","0","1e-005","0","1e-005","0","1","0","0" }')                
    else:  
        cmd.error('You must select only one mesh object')
        
def selectBorderEdges(ob):
    #shells = cmd.polyEvaluate(ob, shell = True) 
    cmd.select('%s.vtx[*]' % ob)
    #mel.eval('polySelectBorderShell 0')
    mel.eval('polySelectBorderShell 1')
    #mel.eval('PolySelectConvert 3')
    mel.eval('PolySelectConvert 20')
    
createBaseMesh()           


