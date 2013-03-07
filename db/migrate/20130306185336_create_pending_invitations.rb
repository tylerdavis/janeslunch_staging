class CreatePendingInvitations < ActiveRecord::Migration
  def change
    create_table :pending_invitations do |t|
      t.integer :user_id
      t.integer :group_id
    end
  end
end
