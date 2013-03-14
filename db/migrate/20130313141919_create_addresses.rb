class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :addr
      t.string :addr2
      t.string :city
      t.string :state
      t.string :zip
      t.string :lat
      t.string :long

      t.timestamps
    end

    # Remove address columns from restaurant table
    remove_column :restaurants, :addr
    remove_column :restaurants, :addr2
    remove_column :restaurants, :city
    remove_column :restaurants, :postal_code
    remove_column :restaurants, :state
    remove_column :restaurants, :lat
    remove_column :restaurants, :long
    remove_column :restaurants, :cs_contact_phone

    # Remove address columns from group table
    remove_column :groups, :addr
    remove_column :groups, :addr2
    remove_column :groups, :city
    remove_column :groups, :zip
    remove_column :groups, :state
    remove_column :groups, :lat
    remove_column :groups, :long
    remove_column :groups, :phone

  end
end
