class Group < ActiveRecord::Base

  attr_accessible :name, :lunch_time, :group_orders, :address_attributes

  validates :name, :uniqueness => true

  before_save :convert_time

  belongs_to :address
  accepts_nested_attributes_for :address

  has_and_belongs_to_many :users
  has_many :group_orders

  def convert_time
     @lunch_time = DateTime.parse(lunch_time.to_s)
  end

end
