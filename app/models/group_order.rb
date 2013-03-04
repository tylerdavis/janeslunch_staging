class GroupOrder < ActiveRecord::Base
  attr_accessible :delivery_time, :group_id, :ordr_rid
  belongs_to :group
  before_save :get_restaurant

  API_KEY = "D7gdaKOE0qLxhTwFUQ4Pb9NGiz_-etd8J0USSSS_tks"

  scope :from_today, where(" created_at between ? AND ?", Time.now.utc.beginning_of_day, Time.now.utc.end_of_day)

  def get_restaurant
    time = self.group.lunch_time
    raise DateTime.parse(time).inspect
    # time = time.strftime("%m-%d+%H:%M")
    api = Ordrin::APIs.new(API_KEY, :test)
    address = self.group.address_for_ordr
    restaurants = api.restaurant.get_delivery_list("ASAP", address)
    self.ordr_rid = restaurants.sample['id'] || 0
  end


end
