class GroupOrder < ActiveRecord::Base
  attr_accessible :delivery_time, :group_id, :ordr_rid
  belongs_to :group
  before_save :get_restaurant

  API_KEY = "D7gdaKOE0qLxhTwFUQ4Pb9NGiz_-etd8J0USSSS_tks"

  scope :from_today, where(" created_at between ? AND ?", Time.now.beginning_of_day, Time.now.end_of_day)

  def get_restaurant
    #@TODO - working with everything being Eastern time at the moment. Need to take different timezones into account!
    time = self.group.lunch_time
    time = DateTime.parse(time + ' Eastern')
    api = Ordrin::APIs.new(API_KEY, :test)
    address = self.group.address_for_ordr
    restaurants = api.restaurant.get_delivery_list(time, address)
    begin
      self.ordr_rid = restaurants.sample['id']
    rescue
      self.ordr_rid = 0
    end
  end

end
