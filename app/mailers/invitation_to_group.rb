class InvitationToGroup < ActionMailer::Base
  before_filter :authenticate_user!
  default from: @user.email

  def invitation_email
    @group_name = (params['groupname'])

    @url = ''
    mail(:to => recipient.email, :subject => "Join Jane's Lunch Group", :from => user.email)
  end  
end

#group creator belongs to group && has access to invite emails
#params groupname to make sure invitee sign up is to specific group
#redirect to user page after sign up


