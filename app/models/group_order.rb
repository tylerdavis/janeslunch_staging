class GroupOrder < ActiveRecord::Base
  attr_accessible :delivery_time, :group_id, :ordr_rid
  before_save :get_restaurant

  API_KEY = "D7gdaKOE0qLxhTwFUQ4Pb9NGiz_-etd8J0USSSS_tks"

  scope :from_today, where(" created_at between ? AND ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day)

  belongs_to :group
  has_many :choices
end
