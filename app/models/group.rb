class Group < ActiveRecord::Base
  attr_accessible :addr, :addr2, :city, :name, :phone, :zip
  has_and_belongs_to_many :users
end
