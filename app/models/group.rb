class Group < ActiveRecord::Base
  attr_accessible :addr, :addr2, :city, :name, :phone, :zip, :lunch_time
  has_and_belongs_to_many :users

  validates :name, :addr, :city, :presence => true
  validates :state, :length => { :is => 2 }
  validates :zip, :length => { :is => 5 }
  validates :phone, :length => { :is => 10 }

  def address_for_ordr
    Ordrin::Data::Address.new(addr, city, state, zip, phone, addr2)
  end

  def get_restaurant
    api = Ordrin::APIs.new("D7gdaKOE0qLxhTwFUQ4Pb9NGiz_-etd8J0USSSS_tks", :test)
    restaurants = api.restaurant.get_delivery_list("ASAP", address_for_ordr)
  end


end
