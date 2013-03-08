class UserMailer < ActionMailer::Base
  default from: "info@janeslunch.com"

  def invite_user_to_group(email)
    @url
  end

  def welcome_email(user)
    @user = user
    @url = "http://www.janeslunch.com/users/sign_in"
    mail(:to => user.email, :subject => "Welcome to JanesLunch!")
  end

end