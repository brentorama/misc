def refThese(proj = '', ass = '', rigs =[''], num=0):
    import maya.cmds as cmd
    cmd.namespace(setNamespace=':')
    allRefs = cmd.namespaceInfo(listOnlyNamespaces=True, recurse=False)  
    for rig in rigs:
        rigCur = rig + '.cur'
        numRigs = 1
        ns = rig  
        for one in allRefs:
            if ns in one:
                numRigs+=1
        for i in range(numRigs,num+numRigs):
            asset = '//192.168.11.207/%s/assets/%s/%s/%s.ma' %(proj,ass,rig,rigCur)
            print asset + ' %s will be referenced' % i
            cmd.file(asset, r=True, namespace = ns+'%s'%i )
                   
refThese('ams', 'rig', ['buildings'], 1)

