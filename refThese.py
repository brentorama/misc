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

def GetRefs(self, node, refs=None):  
    # Return the first reference nodes hit in a given node / node list
    if refs == None:
        refs = set([])         
    nodes = cmds.ls(node)
    for node in nodes:
        isRef = cmds.referenceQuery(node, inr=True)
        if isRef:
            refs.add (cmds.referenceQuery(node, rfn=True))
        else:
            children = cmds.listRelatives(node)
            refs = self.GetRefs(children, refs)
    return refs


def ImportRefs(self, refs=[], deleteNs=True):
    if len(refs) == 0:
        das.pprint("[mzAssetIO] No reference nodes provided")
        return False
    for ref in refs:
        ns = cmds.referenceQuery(ref, ns=True)
        try:
            cmds.file(rfn = ref, ir=True)
            das.pprint("[mzAssetIO] Import from reference node %s" % ref)
            if deleteNs:
                das.pprint("[mzAssetIO] Deleting namespace %s" % ns)
                cmds.namespace(mv = (ns, ":"), f=True)
                #cmds.namespace(force=True,rm=ns)
        except:
            das.pprint("[mzAssetIO] Could not import from references %s" % ",".join(refs))
            return False
    return True