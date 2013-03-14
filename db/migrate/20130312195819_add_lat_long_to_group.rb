class AddLatLongToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :lat, :string
    add_column :groups, :long, :string
  end
end
