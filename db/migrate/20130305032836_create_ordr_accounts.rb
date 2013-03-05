class CreateOrdrAccounts < ActiveRecord::Migration
  def change
    create_table :ordr_accounts do |t|
      t.integer :user_id
      t.string :addr
      t.string :addr2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :first
      t.string :last
      t.string :card_nick

      t.timestamps
    end
  end
end
