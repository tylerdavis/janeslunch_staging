class Suboption < ActiveRecord::Base
  attr_accessible :descrip, :name, :ordrin_id, :price

  belongs_to :option

  def as_json(options={})
    {
      :name       => self.name,
      :ordrin_id  => self.ordrin_id,
      :price      => self.price
    }
  end
end
