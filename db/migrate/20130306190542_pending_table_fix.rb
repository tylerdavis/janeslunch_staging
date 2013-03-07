class PendingTableFix < ActiveRecord::Migration
  def up
    remove_column :pending_invitations, :created_at
    remove_column :pending_invitations, :updated_at
  end

  def down
  end
end
