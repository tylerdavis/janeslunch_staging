class AddOptionIdToSuboptions < ActiveRecord::Migration
  def change
    add_column :suboptions, :option_id, :integer
  end
end
