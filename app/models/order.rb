class Order < ActiveRecord::Base
  attr_accessible :tip

  belongs_to :user
  belongs_to :group_order
  belongs_to :item
end
