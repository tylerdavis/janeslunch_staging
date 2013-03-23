class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
    render :new
  end
  
  def create
    @invitation = Invitation.new(params[:invitation])
    recipient = User.new
    @invitation.group_id = params[:id]
    @invitation.user_id = self.user_id
    if @invitation.save
      InvitationMailer.group_invitation.deliver
      redirect_to user_root_path :notice => "Your invitation has been sent!"
    else
      render :new 
    end  

  end  
end
