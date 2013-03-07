class RemoveInvitationColumns < ActiveRecord::Migration
  def up
  end

  def down
    remove_column :invitations, :created_at
    remove_column :invitations, :updated_at
  end
end
