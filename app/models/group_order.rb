class GroupOrder < ActiveRecord::Base

  attr_accessible :delivery_time, :group_id, :restaurant

  scope :from_today, where(" created_at between ? AND ?", Time.now.beginning_of_day, Time.now.end_of_day)

  belongs_to :group
  belongs_to :restaurant
  
  has_many :group_orders_items
  has_many :items, :through => :group_orders_items
  
end
