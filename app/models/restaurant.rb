class Restaurant < ActiveRecord::Base
  attr_accessible :addr, :addr2, :city, :cs_contact_phone, :cuisine, :name, :ordrin_id, :postal_code, :state, :items

  has_many :items
  has_many :group_orders
end
