class Item < ActiveRecord::Base
  attr_accessible :descrip, :name, :ordrin_id, :price

  belongs_to :restaurant
  belongs_to :group_order
  has_many :options
end
