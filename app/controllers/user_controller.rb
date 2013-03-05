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
      
      update_ordr_account()

      redirect_to user_path, :notice => "You updated you!"
    else
    end  
  end

  def update_ordr_account(email, password, first, last)
    address = @billing_address
    login = Ordrin::Data::UserLogin.new(@email, @encrypted_password)
    user = $ordrin.user.create(login, first, last)
    raise user
    # if $ordrin.user.update(email, first, last)
  end

#======= Helpers

  def billing_address
    Ordrin::Data::Address.new(@user.addr, @user.city, @user.state, @user.zip, @user.phone, @user.addr2)
  end

  def ordr_login
    Ordrin::Data::UserLogin.new(@user.email, @user.encrypted_password)
  end

  def update_ordr_account
    if @user.ordr_account_id == nil || @user.ordr_account_id == ""
      u = $ordrin.user.create(ordr_login, @user.first, @user.last)
    else
      #@TODO this should use user.update but for some reason we get 401.
      u = $ordrin.user.create(ordr_login, @user.first, @user.last)
    end
    @user.ordr_account_id = u['user_id']
    @user.save
  end

  def create_credit_card

  end

end
