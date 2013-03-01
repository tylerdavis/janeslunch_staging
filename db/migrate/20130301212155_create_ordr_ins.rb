class CreateOrdrIns < ActiveRecord::Migration
  def change
    create_table :ordr_ins do |t|

      t.timestamps
    end
  end
end
