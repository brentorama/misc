from maya import cmds as cmd
import re
unicodes = [chr(i) for i in range(100)]

alfa =  [chr(i) for i in range(ord('B'),ord('Z')+1)]
for i in range(len(sel)):
    newname = '%s_%s_%s' %('L', alfa[i], 'loc')
    print newname
    cmd.rename(sel[i], newname)
    
    
def jntCTL(joint, ctl, gp):
    #this command expects a joint and a group to be selected.
    sel = cmd.ls(sl = True)
    result = cmd.parentConstraint(joint, gp)
    cmd.delete(result)
    for rs in ['.r', '.s']:
        cmd.connectAttr(ctl+rs, joint+rs)
    cmd.pointConstraint(ctl, joint, mo = 0)

def makePipeJoints():
    #track selection order must be on for this to work
    joints = []
    sel = cmd.ls(os=True)
    obj = cmd.ls(sl=True, o=True)
    name = obj[0].rsplit('_', 1)[0]
    for one in sel:
        strip = re.search(r"\[([0-9]+)\]", one)
        num = strip.group(1)
        cmd.select(one)
        cmd.polySelect(el=int(num))   
        clust = cmd.cluster(n = 'poo#')
        posi = cmd.getAttr(clust[0]+'HandleShape.origin') 
        cmd.delete (clust[0])
        size = len(joints)
        joints.append(cmd.joint(n='%s_%s_JNT' %(name, size+1),p = posi[0]))
        if size > 0:
            cmd.parent(joints[size], joints[size-1])
            cmd.joint(joints[size-1], e=True, oj = 'xyz', sao = 'yup')
            circle = cmd.circle(nr = [1, 0, 0], n='%s_%s_CTL' %(name, size))
            group = cmd.group(n = '%s_GP' %(circle[0]))
            jntCTL(joints[size-1], circle[0], group)           
        if size > 1:
            cmd.parentConstraint(joints[size-2], group, mo =1)
    cmd.select(joints, obj[0])
    cmd.skinCluster(mi=4)

def resetTranforms():
    atVals = {'sx':1, 'sy':1, 'sz':1, 'rx':0, 'ry':0, 'rz':0, 'tx':0, 'ty':0, 'tz':0}
    sel = cmd.ls(sl=True, tr=True)
    for obj in sel:
        for attr in atVals:
            try:
                cmd.setAttr('%s.%s'%(obj, attr), atVals[attr])
            except:
                pass
      
resetTranforms()   

def doSomething():
    amt = ['0.05']
    i = 0
    attribute = '.noiseSpeed'
    selection = cmds.ls(sl=True)
    amt = cmds.getAttr(selection[0]+attribute)
    count = len(selection)
    for ctl in range (i, count):
        cmds.setAttr(selection[ctl]+attribute, amt)
        amt += 0.02
doSomething()


import maya.cmds as cmd
import os

for i in range(1,8):
    cmd.parentConstraint('mPipeBRig_cur3:rivet'+str(i)+'_CRV', 'mWireARig_cur1:wire'+str(i)+'_CTL')
      
for i in range(7,8):
    cmd.connectAttr('scaleTen.output', 'rivet'+str(i)+'_CRV_GP.scale')
clear(fileName)

            

def refThese(proj = 'ggt', ass = 'character', rigs =['ROUGH'], num=1):
	import maya.cmds as cmd
    cmd.namespace(setNamespace=':')
    allRefs = cmd.namespaceInfo(listOnlyNamespaces=True, recurse=False)  
    for rig in rigs:
        rigCur = rig + '_rig_cur'
        numRigs = 1
        #ns = rigCur.replace('.', '_')
        ns = rig       
        for one in allRefs:
            if ns in one:
                numRigs+=1
        for i in range(numRigs,num+numRigs):
            #project specific path
            asset = '//192.168.11.207/%s/_M0501_RENU/maya/assets/%s/%s/%s.ma' %(proj,ass,rig,rigCur)
            print asset + ' '+ str(i) + ' will be referenced'
            cmd.file(asset, r=True, namespace = ns+str(i) )
            
refThese('renu', 'character', ['ROUGH'], 2)


allRefs[0].endswith('mPipeBRig.cur'+'.ma')

a=[1,2,3,4,7,8,10]
from itertools import imap, chain
from operator import sub
print list(chain.from_iterable((a[i] + d for d in xrange(1, diff))for i, diff in enumerate(imap(sub, a[1:], a))if diff > 1))
[5, 6, 9]


import os

def renameFiles(*arg):   
    path, name, ex, fname, do = arg[0], arg[1], arg[2], arg[3], arg[4]
    fullpath = os.path.join(path, name, fname)
    i=1
    raw=[]
    files=[]
    raw = os.listdir( fullpath )
    for this in raw:
        if this.endswith(ex):
            files.append(this)
    files.sort()
    for filename in files:
        newFile = fname+'.'+name+'.'+str(i)+ex
        i +=1
        old = os.path.join(fullpath, filename)
        new = os.path.join(fullpath, newFile)
        if (do):
            os.rename(old, new)
    print '%d files renamed' % i
    
def renameIt():
    path = os.path.realpath("//192.168.11.207/anf/shots/")
    #names = ['050','060','070','080','090','100','110','120','130','140','150']
    names = ['c015']
    fileName = 'imgPlate'
    extension = ".png"
    for name in names:
        renameFiles(path, name, extension, fileName, 1) 
        
renameIt()


def matrixBlend():
    sel = cmd.ls(sl=True)
    m = 'matrixIn'
    wt = cmd.createNode('wtAddMatrix')
    multi = cmd.createNode('multMatrix')
    decomp = cmd.createNode('decomposeMatrix')
    parent = cmd.listRelatives(sel[2], ap = True)
    cmd.connectAttr('%s.%s' % (wt, 'matrixSum'), '%s.%s%s' % (multi, m, '[0]'))
    cmd.connectAttr('%s.%s' % (multi, 'matrixSum'), '%s.%s' % (decomp, 'inputMatrix'))
    cmd.connectAttr('%s.%s' % (sel[0], 'worldMatrix[0]'), '%s.%s.%s' % (wt, 'wtMatrix[0]',m))
    cmd.connectAttr('%s.%s' % (sel[1], 'worldMatrix[0]'), '%s.%s.%s' % (wt, 'wtMatrix[1]',m))
    cmd.connectAttr('%s.%s' % (decomp, 'outputTranslate'), '%s.%s' % (sel[2], 'translate'))
    cmd.connectAttr('%s.%s' % (decomp, 'outputRotate'), '%s.%s' % (sel[2], 'rotate'))
    cmd.connectAttr('%s.%s' % (decomp, 'outputScale'), '%s.%s' % (sel[2], 'scale'))
    cmd.connectAttr('%s.%s' % (parent[0], 'worldInverseMatrix[0]'), '%s.%s%s' % (multi, m, '[1]'))
    cmd.setAttr('%s.%s' % (sel[2], 'jointOrient'), 0,0,0 )
    cmd.select(sel[2], r=True)

matrixBlend()


bones = cmd.ls(sl =True, type = 'joint')
for one in bones:
    cmd.setAttr(one+'.radius', 1)

def cvsToCLR():
    type = '_CLR'
    i = 1
    name = 'mid'
    cvs = cmd.filterExpand(ex = True, sm = 28)
    for one in cvs:
        cmd.select(one)
        cmd.cluster(name='%s%d%s'% (name, i, type))
        cmd.group(name='%s%d%sGP'% (name, i, type))
        

        i += 1

cvsToCLR()

#select edgeLoop from edge
import re
import maya.cmds as cmd
edge = cmd.ls(sl=True)
id = re.findall('\d+',(edge[0].split('.')[1]))
cmd.polySelect(el=int(id[0]))

[('pointOnSurfaceInfo', 'pos', u'pos4'),
 ('loft', 'lft', u'lft'),
 ('fourByFourMatrix', 'mat', u'mat'),
 ('decomposeMatrix', 'dcp', u'dcp')]


 
def lotteryPicker(numTix, picks, possible):
    import random
    import time
    import math
    possible += 1
    start_time = time.time()
    n = math.factorial(possible)
    k = math.factorial(picks)* math.factorial(possible-picks)
    combos = n/k
    comboStr= '{:,.0f}'.format(combos) 
    limit = 10000
    tix = min(numTix, limit)
    comTix = combos/tix
    odds = '{:,.0f}'.format(comTix) 
    print 'Calculating your winning numbers:'
    for i in range(tix):
        ints = sorted(random.sample(range(possible), picks))
        print ints

    print '\nYou have a %i in %s chance of winning the jackpot \nOr 1 in %s\nor a %f%% chance' % (tix, comboStr, odds, 100* (float(1.0)/float(comTix))) 
    output =  'This calculation took %s seconds' % round((time.time() - start_time),2)
    print output

lotteryPicker(10, 6, 49)




import sys
sys.path.append("//192.168.11.200/_AC_work/forrest/scripts/")


import playBetter as pb
reload(pb)
pb.BaseWindow()

import vlcMaya as vlc
reload(vlc)
vlc.BaseWindow()

def doThis():
    doos = cmd.ls(sl=True)
    for RGB in ['R','G','B']:
        cmd.connectAttr(doos[0]+'.brite', doos[1]+'.colorOffset'+RGB)
doThis()

def copyShaders():
    group=cmd.ls(sl=True, l=True)
    group1 = cmd.listRelatives(group[0],c=True)
    group2 = cmd.listRelatives(group[1],c=True)
    size = len(group1)
    for i in range(size):
        print group1[i]
        cmd.select(group[0]+'|'+group1[i])
        cmd.hyperShade(smn=True)
        shader = cmd.ls(sl=True)
        cmd.select(group[1]+'|'+group2[i])
        cmd.sets(e = True, fe = shader[0]+'SG')

import maya.cmds as cmd

copyKeysGlobal = ['print /"No keys copied/"']

def copyKeys():
    global copyKeysGlobal   
    del copyKeysGlobal[:]
    obs = cmd.ls(sl=True, tr=True)
    ref = cmd.referenceQuery(obs[0], ns = True).split(':')[1]
    for ob in obs:
        base = ob.split(':')[1]
        get = ref+':'+base
        for at in cmd.listAttr(get, k=True, u=True, v=True):
            obat = '%s.%s'%(get,at)
            val = str(cmd.getAttr(obat))
            copyKeysGlobal.append('%s.%s %s'%(base,at,val))
    print copyKeysGlobal
    
copyKeys()


import maya.cmds as cmd


def pasteKeys():
    global copyKeysGlobal
    obs = cmd.ls(sl=True, tr=True)
    ref = cmd.referenceQuery(obs[0], ns = True).split(':')[1]
    for item in copyKeysGlobal:
        part = item.split()
        pasteTo = ref+':'+part[0]
        try:
            cmd.setAttr(pasteTo, float(part[1]))
        except Exception as e:
            print '%s %s %s failed' %(type(e),pasteTo,part[1])
            pass        
pasteKeys()


import os
import maya.cmds as cmd

shadDir = '//192.168.11.207/ams/images/textures/buildings/'
ext = '.png'

for file in [f for f in os.listdir(shadDir) if f.endswith(ext)]:
    base = file.split(ext)[0]
    imgPath = '%s%s' %(shadDir, file)
    shader = '%s%s' % (base, 'MT')
    sGroup = '%s%s' % (base, 'MTSG')   
    shader=cmds.shadingNode("surfaceShader", asShader=True, n = shader)
    file_node = cmds.shadingNode("file", asTexture=True, icm = True)
    proj_node = cmds.shadingNode("projection", asTexture=True)
    place_node = cmds.shadingNode("place3dTexture", au=True)
    shaderGroup = cmd.sets(r = True, em = True, n = sGroup)
    cmd.connectAttr('%s.wim[0]' %place_node, '%s.pm' %proj_node, force = True)
    cmd.connectAttr('%s.outColor' %shader ,'%s.surfaceShader' %shaderGroup, force = True)
    cmds.setAttr('%s.fileTextureName' %file_node, imgPath, type = 'string')
    cmd.connectAttr('%s.outColor' %file_node, '%s.image' %proj_node, force = True)
    cmd.connectAttr('%s.outColor' %proj_node, '%s.outColor' %shader, force = True)
    cmd.setAttr('%s.projType' %proj_node, 8)
    cmd.connectAttr('renderShape.message', '%s.linkedCamera' %proj_node)
    try:
        cmd.sets(base, e=True, fe=sGroup)
    except:
        continue
#RapidRig Hepers

import maya.cmds as cmd
obs = cmd.ls(sl=True)
cmd.select(hi = True)
for one in obs:
    for att in ['RRARigName', 'RRARigConnection']:
        exists = cmd.attributeQuery (att, node = one, ex = True)
        if exists:
            trash = (one+'.'+att)
            cmd.setAttr(trash, l = False)
            cmd.deleteAttr(one+'.'+att)
    
    
def makeAsset():
    nodes = []
    root = cmd.group(em = True, name = 'root')
    for one in ['anim', 'setup', 'render']:
        node = cmd.group(p = root, em = True, name = '%s_GP' % (one))
        nodes.append(node)
    ctlGP = cmd.group(em = True, p = nodes[0], name = 'CTL_GP')     
    CTL = cmd.circle(nr= (0, 1, 0), name = 'CTL')
    cmd.parent(CTL[0], ctlGP)
    lib = {'guts':1,'meshDisplay':2}
    for key, val in lib.iteritems() :
        cmd.addAttr(ctlGP, k = True, ln= key, at = 'long', min = 0, max = val, dv = 0)
    cmd.connectAttr('%s.guts' % ctlGP, '%s.%s' % (nodes[1], 'v'))
    for i in ['overrideEnabled', 'overrideDisplayType']:
        cmd.connectAttr('%s.meshDisplay' % ctlGP, '%s.%s' % (nodes[2], i))

