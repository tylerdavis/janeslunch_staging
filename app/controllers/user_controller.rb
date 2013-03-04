class UserController < ApplicationController
  before_filter :authenticate_user!
  

  def index
    if user_signed_in?
      @user = current_user
    end
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Success!"
    else
      render "new"
    end
  end
end
