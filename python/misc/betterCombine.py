
import maya.cmds as mc
def betterCombine():
	t = mc.ls(sl=1, s=1)
	cA = mc.connectAttr
	cN = mc.createNode
	m = "mesh"
	i = 0
	t = cN("transform", n = m)
	u = cN("polyUnite", n = "combine")
	m = cN(m, n = "%sShape" % t, p=t)
	for o in t:
		cA("%s.outMesh" % o, "%s.inputPoly[%s]" % (u,i))
		cA("%s.worldMatrix[0]" % o, "%s.inputMat[%s]" % (u,i))
		i+=1
	cA("%s.output" % u, "%s.inMesh" % m, f=1)
	