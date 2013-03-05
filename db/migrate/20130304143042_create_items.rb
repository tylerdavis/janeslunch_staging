class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :descrip
      t.string :name
      t.integer :ordrin_id
      t.float :price
      t.belongs_to :group_order

      t.timestamps
    end
  end
end
