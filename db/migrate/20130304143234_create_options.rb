class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :descrip
      t.string :name
      t.integer :ordrin_id
      t.float :price

      t.timestamps
    end
  end
end
