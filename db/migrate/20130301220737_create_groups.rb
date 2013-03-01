class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :addr
      t.string :city
      t.string :zip
      t.string :phone
      t.string :addr2

      t.timestamps
    end

    create_table :groups_users, :id => false do |t|
      t.integer :group_id
      t.integer :user_id
    end

    add_index :groups_users, [:group_id, :user_id]

  end
end
