class AddUserIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :user_id, :integer
    add_column :orders, :group_order_id, :integer
    add_column :orders, :item_id, :integer
  end
end
