import maya.cmds as cmd
import sys

path = ('Z:/marza/home/brent/scripts/')
if path in sys.path:
    print 'good'
else:
    sys.path.append(path)

from color_Lib import Color_Lib as colorBuddy

colorList = []
for key in colorBuddy().list():
    colorList.append(colorBuddy().get_color(key))
    
selected = cmd.ls(sl=True)

for one in range(len(selected)):
    for rgb, abc in zip('RGB', '012'):
        cmd.setAttr('%s.overrideColor%s' % (selected[one], rgb), colorList[one][int(abc)])
    cmd.setAttr('%s.overrideEnabled' % selected[one], 1)
    cmd.setAttr('%s.overrideRGBColors' % selected[one], 1)


