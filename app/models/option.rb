class Option < ActiveRecord::Base
  attr_accessible :descrip, :name, :ordrin_id, :price

  belongs_to :item
  has_many :suboptions
end
