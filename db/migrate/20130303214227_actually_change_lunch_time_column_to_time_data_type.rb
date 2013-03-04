class ActuallyChangeLunchTimeColumnToTimeDataType < ActiveRecord::Migration
  def change
    change_column :groups, :lunch_time, :time
  end
end
