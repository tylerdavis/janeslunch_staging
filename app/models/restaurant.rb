class Restaurant < ActiveRecord::Base

  attr_accessible :cuisine, :name, :ordrin_id, :items

  has_one :address
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