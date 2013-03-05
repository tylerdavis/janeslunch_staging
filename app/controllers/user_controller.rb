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

  def edit

    if user_signed_in?
      @user = current_user
    end   
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Success!"
    else
      render "new"
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      
      update_ordr_account(@user.email, @user.password, @user.first, @user.last)

      redirect_to user_path, :notice => "You updated your group!"
    else
    end  
  end

  def update_ordr_account(email, password, first, last)
    address = self.billing_address
    login = self.ordr_login
    user = $ordrin.user.create(login, first, last)
    raise user
    # if $ordrin.user.update(email, first, last)
  end



end
