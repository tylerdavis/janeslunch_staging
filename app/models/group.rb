class Group < ActiveRecord::Base
  attr_accessible :addr, :addr2, :city, :name, :phone, :zip, :lunch_time
  has_and_belongs_to_many :users
end
