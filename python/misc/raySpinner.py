import maya.cmds as cmd
import sys
path = ('Z:/marza/home/brent/scripts/')
if path in sys.path:
    print 'good'
else:
    sys.path.append(path)
from color_Lib import Color_Lib as colorBuddy

def findAllShapes(obj):
    faces = {}
    faces = set()
    faceCount = cmd.polyEvaluate(obj, f=True)
    for i in range(faceCount):
        faces.add(i)
    d = dict() 
    i = 1   
    while len(faces) > 0:
        if i > 100:
            break
        start = (faces.pop())   
        faces.add(start)
        shellFaces = cmd.polySelect(obj, ets=start)
        verts = cmd.polyListComponentConversion(ff=True, tv=True)
        d[i] = verts
        for this in shellFaces:
            faces.remove(this)
        i += 1
    return(d)

#select the border edges of each shape - find the holes in each shell   
 
def createNewCurveShapes(obj): 
    newCurves = []  
    d = findAllShapes(obj)
    for one in d:
        loc = []  
        borderEdges = {}
        borderEdges = set()
        edges = cmd.polyListComponentConversion(d[one], fv=True, te=True)
        cmd.select(edges)
        mel.eval('polyConvertToShellBorder')
        borders = cmd.ls(sl=True, fl= True) 
        for b in borders:
            borderEdges.add(b)     
        h = 0     
        while len(borderEdges) > 0:
            if h > 100:
                break
            start = (borderEdges.pop())   
            borderEdges.add(start)
            cmd.select(start)
            firstEdge= int(start[start.find('[')+1:start.find(']')])
            cmd.polySelect(obj, eb=firstEdge)
            borderEdge = cmd.ls(sl=True, fl= True)
            newCurve = cmd.polyToCurve(form = 1, degree = 1, ch = False)[0]
            newCurves.append(newCurve) 
            for this in borderEdge:
                borderEdges.remove(this)
            h += 1
    return newCurves

def constructRayCaster(obj, intersectors):
    iNodes = []
    arcLength = 'arcLen'
    maxSize = cmd.getAttr('%s.boundingBoxSize' % obj)
    pythag = math.sqrt(maxSize[0][0]**2 + maxSize[0][1]**2)
    ray = cmd.curve(d=1, p = [(0, 0, 0), (pythag, 0, 0)])
    cmd.setAttr('%s.overrideEnabled' % ray, 1)
    cmd.setAttr('%s.overrideRGBColors' % ray, 1)
    rayShape = cmd.listRelatives(ray, ni= True, s = True)[0]
    if not cmd.objExists(arcLength):
        arcLength = cmd.shadingNode('arcLengthDimension', au = True, n = arcLength)
    cmd.connectAttr('%s.worldSpace[0]' % rayShape, '%s.nurbsGeometry' % arcLength)
    for one in intersectors:
        iNodes.append(cmd.curveIntersect(rayShape, one, ud = True, dz = True, ch=True))
    return iNodes, arcLength, rayShape, ray
    
def getShortestSection(pos, precision, iNodes, ray, arcLength, angle, flip):
    outLen = 1.0
    outPer = 1.0
    shortest = 20.0
    length = 20.0
    cmd.xform(ray, t = pos)
    degrees = range(precision)
    if flip:
        degrees = range(precision, 0, -1)
    for i in degrees:
        angle1 = (180.0 / precision) * i + angle
        cmd.setAttr('%s.rz' % ray, angle1)
        arcLen1 = getFirstRay(iNodes, arcLength)
        if arcLen1 > length:
            continue
        angle2 = angle1 + 180
        cmd.setAttr('%s.rz' % ray, angle2)
        arcLen2 = getFirstRay(iNodes, arcLength)
        if arcLen2 > length:
            continue
        length = max(0.001, arcLen1 + arcLen2)
        percent = 1 - ((min(arcLen1, arcLen2) / length) * 2)
        if length < shortest:
            shortest = length
            outPer = percent
            outLen = length
            outAngle = angle1
    return outLen, outPer, outAngle

def getFirstRay(iNodes, arcLength):
    #get the first colliding ray of all possible collisions
    shortest = 1.1
    for one in iNodes:
        result = cmd.getAttr('%s.parameter1' % one)
        if len(result[0]) > 0:
            for val in result[0]:
                if val < shortest:
                    shortest = val
    cmd.setAttr('%s.uParamValue' % arcLength, shortest)
    result = cmd.getAttr('%s.arcLength' % arcLength) 
    return result
    
def performBumpCaster(obj, precision = 24):
    angle = 0.0
    precision = 12    
    colorList = []
    for key in colorBuddy().list():
        colorList.append(colorBuddy().get_color(key))
    intersectors = createNewCurveShapes(obj)
    iNodes, arcLength, rayShape, ray = constructRayCaster(obj, intersectors) 
    allVerts = cmd.polyListComponentConversion(obj, tv=True)[0]
    cmd.select(allVerts)
    list = cmd.ls(sl=True, fl = True)
    cmd.select(cl=True)
    f = 0
    c=0 
    for vert in list:
        c+=1
        f^= 1
        pos = cmd.pointPosition(vert)
        for rgb, abc in zip('RGB', '012'):
            cmd.setAttr('%s.overrideColor%s' % (ray, rgb), colorList[c%48][int(abc)])
            #cmds.polyColorPerVertex(vert, rgb=colorList[c%48] )
        length, percent, angle = getShortestSection(pos, precision, iNodes, ray, arcLength, angle, f)
        bump = (math.sqrt(1.0-(percent**2))) * length * 0.5
        cmd.move(0, 0, bump, vert, r = True, os = True, wd = True ) 
        cmd.refresh()
        #dupe = cmd.duplicate(ray)
        #cmd.xform(dupe, s = (bump* 0.01, 1, 1))   
    for junk in iNodes:
        cmd.delete(junk)   
    for junk in [arcLength, ray]:
        cmd.delete(junk)
    for junk in intersectors:
        cmd.delete(junk)

