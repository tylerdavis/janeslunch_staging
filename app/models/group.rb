class Group < ActiveRecord::Base
  attr_accessible :name, :addr, :city, :state, :zip, :phone, :addr2, :lunch_time, :group_orders

  validates :name, :uniqueness => true
  validates :addr, :city, :presence => true
  validates :state, :length => { :is => 2 }
  validates :zip, :length => { :is => 5 }

  before_save :convert_time

  def address_for_ordr
    Ordrin::Data::Address.new(addr, city, state, zip, phone, addr2)
  end

  def convert_time 
     @lunch_time = DateTime.parse(lunch_time.to_s)
  end

  has_and_belongs_to_many :users
  has_many :group_orders

end