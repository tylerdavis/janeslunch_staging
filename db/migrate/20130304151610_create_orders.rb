class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :tip

      t.timestamps
    end
  end
end
