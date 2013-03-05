class Choice < ActiveRecord::Base
  # attr_accessible :title, :body

  has_one :item
  belongs_to :group_order
end
