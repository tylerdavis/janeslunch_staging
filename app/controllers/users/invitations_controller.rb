class Users::InvitationsController < Devise::InvitationsController

  def new
    @group = params["id"]
    $groupHAHA = @group
    build_resource
    render :new
  end
  
  def create
    invitation = PendingInvitations.new
    invitation.group_id = params["group"]
    self.resource = resource_class.invite!(resource_params, current_inviter)
    invitation.user_id = self.resource.id
    invitation.save

    if resource.errors.empty?
      set_flash_message :notice, :send_instructions, :email => self.resource.email
      respond_with resource, :location => after_invite_path_for(resource)
    else
      respond_with_navigational(resource) { render :new }
    end
  end  

  def edit
    if params[:invitation_token] && self.resource = resource_class.to_adapter.find_first( :invitation_token => params[:invitation_token] )
      render :edit
    else
      set_flash_message(:alert, :invitation_token_invalid)
      redirect_to after_sign_out_path_for(resource_name)
    end
  end

  def update
    self.resource = resource_class.accept_invitation!(resource_params)

    if resource.errors.empty?
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active                                                                                        
      set_flash_message :notice, flash_message
      sign_in(resource_name, resource)
      respond_with resource, :location => after_accept_path_for(resource)
      
    else
      respond_with_navigational(resource){ render :edit }
    end
  end

end

