
import maya.cmds as cmds
import math

class round:
	def __init__(self):
		self.round()


	def round(self):
		sel = cmds.ls( sl=True)
		if not sel:
			cmds.warning("nothing selected")
			return 
		vertSets = self.prepSelection(sel)
		cmds.select(clear=True)
		print 'have '+str(len(vertSets))+' selection sets'
		for verts in vertSets:
			self.makeRound(verts)
			
		cmds.select(sel, replace=True)
		
	def makeRound(self,verts):
		ogPoints = cmds.xform(verts, q=True, translation=True, worldSpace=True)
		center = self.averageVec(ogPoints)
		ogPointArray = self.vecArray(ogPoints)
		ogNormals = self.getPolyNormalPerVertex(verts)
		ogNormalArray = self.vecArray(ogNormals)
		
		doSurfaceProjectoin = True
		projectionVector = [0.0,0.0,0.0]
		
		averageVertNormal = self.averageVec(ogNormals)
		if self.magnitude(averageVertNormal) == 0.0:
			doSurfaceProjectoin = False
		else:
			projectionVector = self.normalize(averageVertNormal)
		
		pointPlaneNormal = self.getPointPlane(ogPointArray)
		if abs(self.dot(averageVertNormal,pointPlaneNormal)) < 0.3:
			doSurfaceProjectoin = False
		
		newPointArray = []
	
		if doSurfaceProjectoin:
			print 'round and project'
			
			# project points to plane at center along projection vector		
			for point in ogPointArray:
				newPointArray.append(self.orthoProject(center,projectionVector,point))
				
			# push/pull points to a set distance from a center point
			radius = self.getAvgDistance(center,newPointArray)		
			for i in range(len(newPointArray)):
				newPointArray[i] = self.spherize(center,radius, newPointArray[i])

			# project points back to original vert normal planes
			for i in range(len(newPointArray)):
				intersection = self.linePlaneIntersection(ogPointArray[i],ogNormalArray[i],newPointArray[i],projectionVector)
				if intersection:
					newPointArray[i] = intersection
		else:
			print 'round out'

			projectionVector = pointPlaneNormal
			
			# project points to plane at center along projection vector		
			for point in ogPointArray:
				newPointArray.append(self.orthoProject(center,projectionVector,point))
				
			# push/pull points to a set distance from a center point
			radius = self.getAvgDistance(center,newPointArray)		
			for i in range(len(newPointArray)):
				newPointArray[i] = self.spherize(center,radius, newPointArray[i])
				
		# set the mesh vertex to their now position
		for i in range(len(verts)):
			cmds.xform(verts[i], worldSpace=True, translation=newPointArray[i])

	def prepSelection(self,sel):
		verts = cmds.filterExpand(sel,expand=True,selectionMask=31)
		if verts:
			containedFaces = cmds.polyListComponentConversion( verts, fromVertex=True, toFace=True, internal=True )
			borderEdges = cmds.polyListComponentConversion( containedFaces, fromFace=True, toEdge=True, border=True )
			borderEdges = cmds.ls(borderEdges,fl=True)
			sets = self.getComponentSets(borderEdges)
			for i in range(len(sets)):
				sets[i] = cmds.ls( cmds.polyListComponentConversion( sets[i], fromEdge=True, toVertex=True ), fl=True) 
			return sets
			
		edges = cmds.filterExpand(sel,expand=True,selectionMask=32)
		if edges:
			sets = self.getComponentSets(edges)
			for i in range(len(sets)):
				sets[i] = cmds.ls( cmds.polyListComponentConversion( sets[i], fromEdge=True, toVertex=True ), fl=True) 
			return sets
			
		uv = cmds.filterExpand(sel,expand=True,selectionMask=35)
		if uv:
			containedFaces = cmds.polyListComponentConversion( uv, fromUV=True, toFace=True, internal=True )
			borderEdges = cmds.polyListComponentConversion( containedFaces, fromFace=True, toEdge=True, border=True )
			borderEdges = cmds.ls(borderEdges,fl=True)
			sets = self.getComponentSets(borderEdges)
			for i in range(len(sets)):
				sets[i] = cmds.ls( cmds.polyListComponentConversion( sets[i], fromEdge=True, toVertex=True ), fl=True) 
			return sets
		
		face = cmds.filterExpand(sel,expand=True,selectionMask=34)
		if face:
			borderEdges = cmds.polyListComponentConversion( face, fromFace=True, toEdge=True, border=True )
			borderEdges = cmds.ls(borderEdges,fl=True)
			sets = self.getComponentSets(borderEdges)
			for i in range(len(sets)):
				sets[i] = cmds.ls( cmds.polyListComponentConversion( sets[i], fromEdge=True, toVertex=True ), fl=True) 
			return sets
			
	def getComponentSets(self, looseComponents):
		totalComponents = len( looseComponents )
		sortedComponents = 0	
		componentSets = []
		
		vertComponent = {}
		componentVert = {}
		for component in looseComponents:
			verts = cmds.ls(cmds.polyListComponentConversion(component, toVertex=True), fl=True)
			for vert in verts:
				if vert in vertComponent:
					vertComponent[vert].append(component)
				else:
					vertComponent[vert] = [component]
			componentVert[component] = verts
		
		def getConnectedComponent(component):
			verts = componentVert[component]
			connections = []
			for vert in verts:
				connections.extend( vertComponent[vert] )
			return list(set(connections) - set([component]))
			
		def getRemainingComponent():
			remainingComponents = looseComponents
			for componentSet in componentSets:
				remainingComponents = list(set(remainingComponents)-set(componentSet))
			if remainingComponents:
				return remainingComponents[0]
			else:
				return None
		
		while sortedComponents < totalComponents:
			component = getRemainingComponent()
			if component:
				componentSets.append( [component] )
				sortedComponents += 1
			connections = getConnectedComponent(component)
			while set(connections) - set(componentSets[-1]):
				newConnections = list( set(connections) - set(componentSets[-1]) )
				componentSets[-1].extend( newConnections )
				sortedComponents += len(newConnections)
				connections = []
				for component in newConnections:
					connections.extend( getConnectedComponent(component) )
					
		return componentSets
		
	def orthoProject(self,planeP,planeN,point):
		vec = self.sub(point,planeP)
		dist = self.dot(vec,planeN)
		offset = self.mult(planeN,dist)
		return self.sub(point,offset)
		
	def spherize(self,center,radius,point):
		vec = self.sub(point,center)
		vec = self.normalize(vec)
		vec = self.mult(vec, radius)
		return self.add(vec, center)
		
	def getPointPlane(self,points):
		normal = []
		for i in range(len(points)-2):
			a = points[i]
			b = points[i+1]
			c = points[i+2]
			j = [b[0]-a[0],b[1]-a[1],b[2]-a[2]]
			k = [c[0]-a[0],c[1]-a[1],c[2]-a[2]]
			cross = self.cross(j,k)
			normal.extend(cross)
		return self.normalize(self.averageVec(normal))
	def vecArray(self,vecs): #convert flat list to tupples
		n=len(vecs)/3
		vecArray=[]
		for i in range(n):
			vecArray.append( [vecs[i*3+0], vecs[i*3+1], vecs[i*3+2] ] )
		return vecArray
	def distance(self,a,b):
		d=0.0
		for i in range(len(a)):
			d += (a[i]-b[i]) * (a[i]-b[i])
		return math.sqrt(d)
	def magnitude(self,v):
		return math.sqrt(v[0]*v[0]+v[1]*v[1]+v[2]*v[2])
	def add(self,a,b):
		return [ a[0]+b[0], a[1]+b[1], a[2]+b[2] ]
	def sub(self,a,b):
		return [ a[0]-b[0], a[1]-b[1], a[2]-b[2] ]
	def mult(self,a,b):
		return [ a[0]*b, a[1]*b, a[2]*b ]
	def cross(self,a,b):
		return [ a[1]*b[2] - a[2]*b[1], a[2]*b[0] - a[0]*b[2], a[0]*b[1] - a[1]*b[0] ]
	def normalize(self,v):
		mag = self.magnitude(v)
		return [v[0]/mag,v[1]/mag,v[2]/mag]
	def dot(self,a,b):
		return ( (a[0]*b[0]) + (a[1]*b[1]) + (a[2]*b[2]) ) 
	def averageVec(self,vecs): #expects a flat list, not tupples
		n=len(vecs)/3
		vecArray=[]
		for i in range(n):
			vecArray.append( [vecs[i*3+0], vecs[i*3+1], vecs[i*3+2] ] )
		vecSum=[ 0, 0, 0]
		for j in range(n):
			vecSum =[ vecSum[0]+vecArray[j][0], vecSum[1]+vecArray[j][1], vecSum[2]+vecArray[j][2] ]
		return [ vecSum[0]/float(n), vecSum[1]/float(n), vecSum[2]/float(n) ]
	def line2point(self,a,b,c): #shortest distance from point C to line(AB)
		vAB=[ b[0]-a[0], b[1]-a[1], b[2]-a[2] ]
		vAC=[ c[0]-a[0], c[1]-a[1], c[2]-a[2] ]
		vX=self.cross(vAB,vAC)
		magX=math.sqrt(vX[0]*vX[0]+vX[1]*vX[1]+vX[2]*vX[2])
		magAB=math.sqrt(vAB[0]*vAB[0]+vAB[1]*vAB[1]+vAB[2]*vAB[2])
		if magAB==0:
			magAB=1
		return magX/magAB 
	def linePlaneIntersection(self,planeP,planeN,point,vector):
		point = self.sub(point,self.mult(vector,10000000))
		d = self.dot(planeN,vector)
		t = 0.0
		if d != 0.0:
			t = self.dot(self.sub(planeP,point),planeN) / d
			intersection = self.add(self.mult(vector,t),point)
			return intersection	
		else:
			return None
	def points2plane(self,p1,p2,p3):
		a = [p2[0]-p1[0],p2[1]-p1[1],p2[2]-p1[2]]
		b = [p3[0]-p1[0],p3[1]-p1[1],p3[2]-p1[2]]
		return self.normalize(self.cross(a,b))
	def getAvgNormalPlane(self,points):
		normal = []
		for i in range(len(points)-2):
			normal.extend(self.points2plane( points[0], points[i+1], points[i+2]))
		normal = self.averageVec(normal)
		normal = self.normalize(normal)
		return normal
	def getAvgDistance(self,p1,points):
		n = len(points)
		distance = 0
		for i in range(n):
			distance += self.distance(p1,points[i])
		distance = distance/n
		return distance
	def getPolyNormalPerVertex(self,verts):
		vertNormals = []
		for vert in verts:
			normals = cmds.polyNormalPerVertex(vert, q=True, normalXYZ=True)
			vertNormals.extend(self.normalize(self.averageVec(normals)))
		return vertNormals
	def debugVec(self, point, vector, annotation='', length=100):
		locator = cmds.spaceLocator(p=[0,0,0])
		cmds.xform(locator, ws=True, t=point)
		vp = self.add( point, self.mult( vector, length) )
		ar = cmds.annotate(locator, p=vp, tx=annotation)

