class AddAddressIdToTables < ActiveRecord::Migration
  def change
    add_column :groups, :address_id, :integer
    add_column :restaurants, :address_id, :integer
  end
end
