class AddLatLongToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :lat, :string
    add_column :restaurants, :long, :string
  end
end
