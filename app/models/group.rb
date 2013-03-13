class Group < ActiveRecord::Base

  before_save :convert_time

  attr_accessible :name, :lunch_time, :group_orders

  validates :name, :uniqueness => true

  has_and_belongs_to_many :users
  has_many :group_orders

  def convert_time
     @lunch_time = DateTime.parse(lunch_time.to_s)
  end

end