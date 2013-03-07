class SiteController < ApplicationController
  before_filter :authenticate_user!

  def index
    if user_signed_in?
      redirect_to '/u'
    else
      redirect_to '/users/sign_up'
    end
  end
end
