class MakeLunchTimeColumnTimeDataType < ActiveRecord::Migration
  def change
    change_column :groups, :lunch_time, :date
  end
end
