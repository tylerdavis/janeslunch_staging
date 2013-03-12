module Geo
  
  def address_string
    "#{ self.addr }, #{ self.city }, #{ self.state }"
  end

  def get_lat_long
    res = Geocoder.search(address_string)
    self.lat = res[0].latitude
    self.long = res[0].longitude
  end

end