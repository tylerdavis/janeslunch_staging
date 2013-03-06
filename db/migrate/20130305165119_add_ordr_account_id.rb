class AddOrdrAccountId < ActiveRecord::Migration
  def change
    change_column :users, :ordr_account_id, :string
  end
end