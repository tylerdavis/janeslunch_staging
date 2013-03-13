class Restaurant < ActiveRecord::Base
  include Geo
  include Ordrinapi

  before_save :get_lat_long

  attr_accessible :addr, :addr2, :city, :cs_contact_phone,
                  :cuisine, :name, :ordrin_id, :postal_code,
                  :state, :lat, :long, :items

  has_many :items
  has_many :group_orders

  def self.get_restaurants()
    # Grubhub needs: lat, long, zipCode
    # Ordr.in needs: street_address, city, zipCode

    # @TODO - Restaurant model - get list of restaurants method
    # Return an array of rest_objects [{rest_obj :id, :rating, :api}]  api is either or || gh
  end

  # @TODO - Restaurant model - recommendation methods

  def self.new_with_id(rest_object)
    # Grubhub needs: restaurantId
    # Ordr.in needs: rid

    # @TODO - Restaurant model - new with id method
  end

  def items=(items_array)
    # @TODO - Restaurant model - items writer method
  end

end