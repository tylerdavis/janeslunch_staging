class CreateInvitationstogroups < ActiveRecord::Migration
  def change
    create_table :invitationstogroups do |t|
      t.string :recipeint_email
      t.integer :sender_id
      t.string :token
      

      t.timestamps
    end
  end
end
