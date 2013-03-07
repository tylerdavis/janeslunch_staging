class ChangeInvitationTable < ActiveRecord::Migration
  def up
    add_column :invitations, :user_id, :integer
    add_column :invitations, :group_id, :integer
  end

  def down
    remove_column :invitations, :created_at
    remove_column :invitations, :updated_at
  end
end
