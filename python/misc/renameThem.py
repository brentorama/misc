

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
    path = os.path.realpath('D:/proj/FME/production/_anim_out/sq010/sh080/animation/')
    #names = ['050','060','070','080','090','100','110','120','130','140','150']
    names = ['slated']
    fileName = '0009'
    extension = ".png"
    for name in names:
        renameFiles(path, name, extension, fileName, 1) 
        
renameIt()