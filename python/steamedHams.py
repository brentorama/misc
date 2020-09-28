import requests

class Person(object):
    def __init__(self):
        self.name = None

class NintendoChalmers(Person):
    def __init__(self):
        super(NintendoChalmers, self).__init__()
        self.name = "Superintendant Chalmers"
    
class Seymour(Person):
    def __init__(self):
        super(Seymour, self).__init__()
        self._name = "Armand Tanzarian"
        self.name = "Seymour Skinner"
        self.address = "330 Pikeland Ave, Springfield Oregon, USA"

    def getDirections(self):
        geo_url = "http://maps.googleapis.com/maps/api/geocode/json"
        response = requests.get(geo_url, params = {"address" : self.address, "language" : "en"})
        results = response.json()["results"]
        my_geo = results[0]["geometry"]["location"]
        return("Longitude:",my_geo["lng"],"\n","Latitude:",my_geo["lat"])


class SteamedHams(object):
    pass