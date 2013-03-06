class Option < ActiveRecord::Base
  attr_accessible :descrip, :name, :ordrin_id, :price

  belongs_to :item
  has_many :suboptions

  def as_json(options={})
    {
      :name       => self.name,
      :descrip    => self.descrip,
      :ordrin_id  => self.ordrin_id,
      :suboptions => self.suboptions
     }
  end
end