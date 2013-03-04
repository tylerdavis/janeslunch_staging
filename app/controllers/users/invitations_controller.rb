class Users::InvitationsController < Devise::InvitationsController
  
  def create
    # if @group.has_connection_with(current_user)
      self.resource = resource_class.invite!(resource_params, current_inviter)

      # group_invite = Invite.new(:invitable_type => @group.class.name, :invitable_id => @group.id, :user_id => self.resource.id, :inviter_id => current_inviter.profile.id)
      # group_invite.save!

    if resource.errors.empty?
      set_flash_message :notice, :send_instructions, :email => self.resource.email
      respond_with resource, :location => after_invite_path_for(resource)
    else
      respond_with_navigational(resource) { render :new }
    end

    # end 
  end   
end
