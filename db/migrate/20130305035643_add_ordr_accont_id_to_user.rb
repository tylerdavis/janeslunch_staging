class AddOrdrAccontIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :ordr_account_id, :integer
  end
end



