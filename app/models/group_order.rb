class GroupOrder < ActiveRecord::Base
  attr_accessible :delivery_time, :group_id, :ordr_rid
  belongs_to :group
  before_save :get_restaurant

  API_KEY = "D7gdaKOE0qLxhTwFUQ4Pb9NGiz_-etd8J0USSSS_tks"

  def get_restaurant
    
    api = Ordrin::APIs.new(API_KEY, :test)
    address = self.group.address_for_ordr
    restaurants = api.restaurant.get_delivery_list("ASAP", address)
    restaurants.shuffle
    self.ordr_rid = restaurants[0] || 0
  end


end
