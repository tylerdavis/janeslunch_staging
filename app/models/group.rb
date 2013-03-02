class Group < ActiveRecord::Base
  attr_accessible :addr, :addr2, :city, :name, :phone, :zip, :lunch_time
  has_and_belongs_to_many :users

  def address_for_ordr
    Ordrin::Data::Address.new(addr, city, state, zip, phone, addr2)
  end

end
