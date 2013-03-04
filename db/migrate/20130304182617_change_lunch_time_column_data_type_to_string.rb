class ChangeLunchTimeColumnDataTypeToString < ActiveRecord::Migration
  def change
    change_column :groups, :lunch_time, :string
  end
end