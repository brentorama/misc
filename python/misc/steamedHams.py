import requests

class Person(object):
    def __init__(self):
        self.name = None

class House(object):
    def __init__(self, address):
        self.address = address
        self.onFire = False


class NintendoChalmers(Person):
    def __init__(self):
        super(NintendoChalmers, self).__init__()
        self.name = "Superintendant Chalmers"

    def warp(self, other, force=False)
        obId = id(other)
        if force:
            self = other
            other = SeymourSkinner()
            

class SeymourSkinner(Person):
    def __init__(self):
        super(SeymourSkinner, self).__init__()
        self._name = "Armand Tanzarian"
        self.name = "Seymour Skinner"
        self.address = "330 Pikeland Ave, Springfield Oregon, USA"

    def getDirections(self):
        geo_url = "http://maps.googleapis.com/maps/api/geocode/json"
        response = requests.get(geo_url, params = {"address" : self.address, "language" : "en"})
        results = response.json()["results"]
        my_geo = results[0]["geometry"]["location"]
        return("Longitude:",my_geo["lng"],"\n","Latitude:",my_geo["lat"])

luncheon = "Roast"

class SteamedHams(object):
    Chalmers = NintendoChalmers()
    Seymour = SeymourSkinner()
    TheHouse = House(address = Seymour.address)
    global luncheon

    directions = Seymour.getDirections()
    try:
        Chalmers.goto(directions)
    except Exception as e:
        Chalmers.warp(Seymour, force=True)
        print("I made it, despite %s" % e)

    Seymour.speak(to=Chalmers, "greet")
    Chalmers.react("myeh")
    
        