class AddLast4DigitsToUser < ActiveRecord::Migration
  def change
    add_column :users, :card_last_four, :integer
  end
end
