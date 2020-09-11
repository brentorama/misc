import maya.cmds as cmd
joints = cmd.ls(sl = True)
num = len(joints)
surf = 'detachSurface1'
ctl = 'CTL'
def connectToSurf():
    for one in range(num):
        val =  (float(one) / num) 
        posi = cmd.shadingNode('pointOnSurfaceInfo', au = True, n = 'posi%02d' % one)
        fbfm = cmd.shadingNode('fourByFourMatrix', au = True, n = 'fbfm%02d' % one)
        dcmp = cmd.shadingNode('decomposeMatrix', au = True, n = 'dcmp%02d' % one)
        cmd.connectAttr('%s.outputSurface[1]' % surf, '%s.inputSurface' % posi)
        cmd.setAttr('%s.parameterU' % posi, 0.5)
        cmd.setAttr('%s.parameterV' % posi, val)
        cmd.setAttr('%s.turnOnPercentage' % posi, 1)
        cmd.connectAttr('%s.output' % fbfm, '%s.inputMatrix' % dcmp)
        cmd.connectAttr('%s.outputTranslate' % dcmp, '%s.translate' % joints[one])
        cmd.connectAttr('%s.outputRotate' % dcmp, '%s.rotate' % joints[one])
        for xyz, input in zip('XYZ', '012'):
            cmd.connectAttr( '%s.position%s' % (posi,xyz), '%s.in3%s' % (fbfm,input))        
        for uv, ohTwo in zip('UV', '02'):
            for xyz, input in zip('xyz', '012'):
                cmd.connectAttr( '%s.tangent%s%s' % (posi,uv,xyz), '%s.in%s%s' % (fbfm,ohTwo,input))
        for xyz, input in zip('XYZ', '012'):
            cmd.connectAttr( '%s.normal%s' % (posi,xyz), '%s.in1%s' % (fbfm,input))    


connectToSurf()

for one in joints:
    cmd.select(one)
    cmd.superGroupIt()
    new = cmd.ls(sl=True)
    cmd.parent (new[0], 'root')