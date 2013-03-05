class DestroyPreviousTable < ActiveRecord::Migration
  def up
  end

  def down
    drop_table :invitationstogroups
  end
end
