class Group < ActiveRecord::Base

  attr_accessible :name, :addr, :city, :state, :zip, :phone, :addr2
  has_and_belongs_to_many :users

  def address_for_ordr
    Ordrin::Data::Address.new(addr, city, state, zip, phone, addr2)
  end

end
