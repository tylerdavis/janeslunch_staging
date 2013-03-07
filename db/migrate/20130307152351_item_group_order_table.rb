class ItemGroupOrderTable < ActiveRecord::Migration
  def change
    create_table :group_order_items do |t|
      t.integer :group_order_id
      t.integer :item_id
      t.timestamps
    end
  end
end