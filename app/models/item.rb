class Item < ActiveRecord::Base
  attr_accessible :descrip, :name, :ordrin_id, :price

  belongs_to :restaurant
  has_and_belongs_to_many :group_order
  has_many :orders
  has_many :options

  def as_json(option={})
    {
      :name       => self.name,
      :descrip    => self.descrip,
      :ordrin_id  => self.ordrin_id,
      :price      => self.price,
      :options    => self.options
    }
  end
end
