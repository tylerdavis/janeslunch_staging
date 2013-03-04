class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :addr
      t.string :addr2
      t.string :city
      t.string :cs_contact_phone
      t.string :cuisine
      t.string :name
      t.string :postal_code
      t.integer :ordrin_id
      t.string :state

      t.timestamps
    end
  end
end
