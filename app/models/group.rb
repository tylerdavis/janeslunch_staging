class Group < ActiveRecord::Base

  attr_accessible :name, :addr, :city, :state, :zip, :phone, :addr2
  has_and_belongs_to_many :users

  validates :name, :addr, :city, :presence => true
  validates :state, :length => { :is => 2 }
  validates :zip, :length => { :is => 5 }
  validates :phone, :length => { :is => 10 }

  def address_for_ordr
    Ordrin::Data::Address.new(addr, city, state, zip, phone, addr2)
  end

end
