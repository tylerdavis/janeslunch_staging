class Address < ActiveRecord::Base
  attr_accessible :addr, :addr2, :city, :lat, :long, :state, :zip

  belongs_to :restaurant
  belongs_to :group

  validates :addr, :city, :presence => true
  validates :state, :length => { :is => 2 }
  validates :zip, :length => { :is => 5 }

  after_initialize :get_lat_long

  def address_string
    "#{ self.addr }, #{ self.city }, #{ self.state }"
  end

  def get_lat_long
    res = Geocoder.search(address_string)
    self.lat = res[0].latitude
    self.long = res[0].longitude
  end

  def address_for_ordr
    Ordrin::Data::Address.new(addr, city, state, zip, phone, addr2)
  end

end