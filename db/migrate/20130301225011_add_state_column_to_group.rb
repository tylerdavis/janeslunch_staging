class AddStateColumnToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :state, :string
  end
end
