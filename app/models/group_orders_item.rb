class GroupOrdersItem < ActiveRecord::Base
  belongs_to :group_order
  belongs_to :item
end
