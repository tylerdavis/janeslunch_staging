class AddRestaurantIdToGroupOrders < ActiveRecord::Migration
  def change
    add_column :group_orders, :restaurant_id, :integer
  end
end
