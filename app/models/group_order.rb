class GroupOrder < ActiveRecord::Base
  attr_accessible :delivery_time, :group_id, :ordr_rid
  belongs_to :group
  before_save :get_restaurant

  API_KEY = "D7gdaKOE0qLxhTwFUQ4Pb9NGiz_-etd8J0USSSS_tks"

  ordr_rid=11

  def get_restaurant
    puts "YEAH"
    # api = Ordrin::APIs.new(API_KEY, :test)
    # restaurants = api.restaurant.get_delivery_list("ASAP", self.group.address_for_ordr)
    # restaurants.scramble
    ordr_rid = 10
    delivery_time = Time.now
  end


end
