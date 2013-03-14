class Item < ActiveRecord::Base
  attr_accessible :descrip, :name, :ordrin_id, :price

  belongs_to :restaurant
  has_many :group_orders_items
  has_many :group_orders, :through => :group_orders_items
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
