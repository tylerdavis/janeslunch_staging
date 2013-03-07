class FixGroupOrderItemsTable < ActiveRecord::Migration
  def change
    drop_table :group_order_items
    create_table :group_orders_items do |t|
      t.integer :group_order_id
      t.integer :item_id
    end

  end

end
