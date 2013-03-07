class CreateGroupOrders < ActiveRecord::Migration
  def change
    create_table :group_orders do |t|
      t.integer :group_id
      t.integer :ordr_rid
      t.datetime :delivery_time
      t.timestamps
    end
  end
end