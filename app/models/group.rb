class Group < ActiveRecord::Base
  include Geo

  before_save :get_lat_long
  before_save :convert_time

  attr_accessible :name, :addr, :city, :state, :zip, :coords, :lat, :long, :phone, :addr2, :lunch_time, :group_orders

  validates :name, :uniqueness => true
  validates :addr, :city, :presence => true
  validates :state, :length => { :is => 2 }
  validates :zip, :length => { :is => 5 }


  has_and_belongs_to_many :users
  has_many :group_orders

  def address_for_ordr
    Ordrin::Data::Address.new(addr, city, state, zip, phone, addr2)
  end

  def convert_time 
     @lunch_time = DateTime.parse(lunch_time.to_s)
  end

end