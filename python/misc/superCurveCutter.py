import maya.cmds as cmd
import maya.mel
import itertools
import math

def superCurveCutter():
    tolerance = 0.01
    killList = []
    curveDict ={}
    origCurves = cmd.ls(sl=True)
    
    mel.eval('cutCurvePreset(1,0,0.01,2,0,0,1,2,1)')
    for i in cmd.ls(sl=True, type = 'transform'):
        cmd.rename(i, 'cutCurve#')
    newCurves = cmd.ls(sl=True, type = 'transform')
        
    for one in newCurves:        
        curveShape = cmd.listRelatives(one,type='nurbsCurve')[0]
        cvs = cmd.getAttr('%s.spans' % curveShape) + 2
        pos0 = cmds.pointPosition('%s.cv[0]' % curveShape, world = True)
        pos1 = cmds.pointPosition('%s.cv[%d]' % (curveShape, cvs), world = True)     
        curveDict[one] = [pos0, pos1]
                
    for curve in curveDict.keys():
        compare = []
        for k, v in curveDict.items():
            if curve is k:
                continue
            compare.append(v)
        if isIsolated(curveDict[curve], compare) is True:
            killList.append(curve)
                   
    keep = [x for x in newCurves if x not in killList]
    newShape = cmd.attachCurve (keep, ch =1, rpo = 0, kmk = 1, m =0, name = 'shape')
    cmd.delete(newCurves) 
   
def isIsolated(base, compare, tolerance = 0.01):
    aHasPair = False
    bHasPair = False
    isIsolated = True
    aPoint, bPoint = base
    flat_list = [item for sublist in compare for item in sublist]
    
    for one in flat_list:
        if aHasPair == False:
            distanceA = getEuclideanDistance(aPoint, one) 
            if distanceA <= tolerance:
                aHasPair = True 
        if bHasPair == False:
            distanceB = getEuclideanDistance(bPoint, one) 
            if distanceB <= tolerance:
                bHasPair = True  
    if aHasPair and bHasPair:
        isIsolated = False 
                                              
    return(isIsolated)
    
def getEuclideanDistance(pointA, pointB):
    xA,yA,zA = pointA
    xB,yB,zB = pointB
    result = math.sqrt((xA-xB)**2 + (yA-yB)**2 + (zA-zB)**2)  
    return (result)
                                    
superCurveCutter()