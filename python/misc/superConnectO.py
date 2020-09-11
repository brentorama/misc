import maya.cmds as cmd
import maya.mel

def superConnectO():
    obs = cmd.ls(sl=True)
    selected = mel.eval('selectedChannelBoxAttributes')
    for one in selected:
        for i in range(1, len(obs)):
            cmd.connectAttr('%s.%s' % (obs[0], one), '%s.%s' % (obs[i], one))
			
superConnectO()