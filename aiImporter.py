import maya.cmds as cmd
import string
import glob
import math
import os

#create a UI to import AI files
#initialize

def importAiSequence(tolerance = 0.2):
    
    trash = 0
    files = []
    objects = []
    caption = 'Choose the AI sequence you wish to import'
    curDir = os.path.split(cmd.file(q = True, sn = True))[0]
    input = cmd.fileDialog2(ff='*.ai', ds = 2, fm=1, dir = curDir, cap = caption)
    file = os.path.splitext(os.path.basename(input[0]))[0]
    dir = os.path.dirname(input[0])
    clean = file.rstrip(string.digits)
    group = cmd.group(em = True, n = '%s_GP' % clean)
    
    #list the numbered AI files by name and sort
    
    os.chdir(dir)
    for file in glob.glob('%s*.ai' % clean):
        files.append(file)
    files.sort()
    count = len(files)
    
    #try and import the files
    
    for one in files:
        fileName = os.path.realpath(os.path.join(dir, one))
        try:
            result = cmd.file(fileName, i = True, 
            type = 'Adobe(R) Illustrator(R)', 
            iv = True, 
            ra = True, 
            mnc= True,
            rnn = True,
            pr = True,
            ns = ':', 
            op = 'sc=1.0;group=on',
            itr= 'combine')
            objects.append(result[0])
        except:
            print ('%s has no data or something else is fucked' % one)
            
    #remove the tiny bullshit peices from all groups based on tolerance  
    #find the largest object and reparent it to the main group
    #parent all other object under that object
    #delete the remaining empty nodes
        
    if len(objects):
        i = 0
        for one in objects:
            i+=1
            name = '%s%02d_CRV' % (clean, i)
            bigBoy = ''
            biggest = 0.0 
            kids = cmd.listRelatives(one, ad = True, type = 'nurbsCurve')
            for kid in kids:        
               size = cmd.getAttr('%s.boundingBoxSize' % kid)[0]
               thisBig = math.sqrt(size[0]**2 + size[1]**2 + size[2]**2)
               if thisBig > biggest:
                   biggest = thisBig
                   bigBoy = kid
               if thisBig <= tolerance:
                   ob = cmd.listRelatives(kid, p = True)
                   cmd.delete(ob)
                   trash += 1
            bigOb = cmd.listRelatives(bigBoy, p = True)[0]
            newOb = cmd.parent(bigOb, group)[0]
            newKids = cmd.listRelatives(one, ad = True, type = 'nurbsCurve') 
            if newKids is not None:
                for thisKid in newKids:
                    thisOb = cmd.listRelatives(thisKid, p = True)
                    cmd.parent (thisOb, newOb)
            cmd.delete(one)
            cmd.rename(newOb, name)       
                   
    print('%s objects were deemed too puny to live and were killed' % trash)

importAiSequence()