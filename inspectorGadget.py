

class InspectorGadget(object):
    def __init__(self):
        super(InspectorGadget, self).__init__()


    def _listAttrs(object):
        attributes = [attr for attr in dir(object) if not attr.startswith('__')]
        return attributes

    def getAttList(object):
        attList = []
        attributes = _listAttrs(object)                  
        for a in attributes:
            att = getattr(mTime, a)
            attList.append({a : att})
        return attList