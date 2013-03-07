class RemoveOrdrRidFromGroupOrder < ActiveRecord::Migration
  def change
    remove_column :group_orders, :ordr_rid
  end
end
