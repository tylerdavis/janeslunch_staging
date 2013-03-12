module Geo

  after_initialize :get_lat_long
  
  def address_string
    "#{ self.addr }, #{ self.city }, #{ self.state }, #{ self.zip }"
  end

  def get_lat_long
    res = Geocoder.search(address_string)
    self.lat = res[0].latitude
    self.long = res[0].longitude
  end

end