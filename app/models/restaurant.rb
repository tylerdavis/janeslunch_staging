class Restaurant < ActiveRecord::Base
  include Ordrinapi
  include Geo

  attr_accessible :addr, :addr2, :city, :cs_contact_phone, :cuisine, :name, :ordrin_id, :postal_code, :state, :lat, :long, :items

  has_many :items
  has_many :group_orders

  def self.get_restaurants(options={})
    # Grubhub needs: lat, long, zipCode
    # Ordr.in needs: street_address, city, zipCode

    # Return an array {ordrin : [ids], grubhub : [ids]}
  end

  def self.new_with_id(id)
    # Grubhub needs: lat, long, restaurantId
    # Ordr.in needs: rid
  end

  def options=(option_list)
    
  end

end