
import maya.cmds as cmd
def betterCombine():
	these = cmd.ls(sl=True, s = True)
	cA = cmd.connectAttr
	i = 0
	t = cmd.createNode('transform', n = 'mesh')
	u = cmd.createNode('polyUnite', n = 'combine')
	m = cmd.createNode('mesh', n = '%sShape' % t, p = t)
	for one in these:
		cA('%s.outMesh' % one, '%s.inputPoly[%s]' % (u,i))
		cA('%s.worldMatrix[0]' % one, '%s.inputMat[%s]' % (u,i))
		i+=1
	cA('%s.output' % u, '%s.inMesh' % m, f = True)
	