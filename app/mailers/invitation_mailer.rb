class InvitationMailer < ActionMailer::Base
  default from: "janeslunch@gmail.com"

  def group_invitation
    @user = user
    @group = params[:id]
    @url = 'http://janeslunch.dev/groups/' + @group +'/invitations/accept?invitation_token=' + @invitation_token
    mail(:to => recipient.email, :subject => "Welcome to Jane's Lunch!")
  end
    
end
