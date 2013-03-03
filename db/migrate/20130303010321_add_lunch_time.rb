class AddLunchTime < ActiveRecord::Migration
  def up
    add_column :groups, :lunch_time, :datetime
  end

  def down
  end
end
