class SiteController < ApplicationController
  before_filter :authenticate_user!

  def index
    if user_signed_in?
      redirect_to '/u'
    end
  end
end
