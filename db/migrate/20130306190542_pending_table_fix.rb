class PendingTableFix < ActiveRecord::Migration
  def up
    add_column :pending_invitations, :user_id, :integer
    add_column :pending_invitations, :group_id, :integer
    remove_column :pending_invitations, :created_at
    remove_column :pending_invitations, :updated_at
  end

  def down
  end
end
