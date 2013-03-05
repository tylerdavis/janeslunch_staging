class AddAddressColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :addr, :string
    add_column :users, :addr2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :phone, :string
  end
end
