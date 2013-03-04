class CreateSuboptions < ActiveRecord::Migration
  def change
    create_table :suboptions do |t|
      t.string :descrip
      t.string :name
      t.integer :ordrin_id
      t.float :price

      t.timestamps
    end
  end
end
