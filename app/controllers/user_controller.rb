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
      
      if params[:cc['process_card']] == 'true'
        update_ordr_account()
        update_ordr_cc(params[:cc])
      end

      redirect_to user_path, :notice => "You updated you!"
    else
    end  
  end


#======= Helpers

  def billing_address
    Ordrin::Data::Address.new(@user.addr, @user.city, @user.state, @user.zip, @user.phone, @user.addr2)
  end

  def ordr_login
    return Ordrin::Data::UserLogin.new(@user.email, @user.encrypted_password)
  end

  def credit_card(name, expiry_month, expiry_year, bill_address, number, cvc)
    Ordrin::Data::CreditCard.new(name, expiry_month, expiry_year, bill_address, number, cvc)
  end


  def update_ordr_account()
    if @user.ordr_account_id == nil || @user.ordr_account_id == ""
      api_request = $ordrin.user.create(ordr_login, @user.first, @user.last)
    else
      api_request = $ordrin.user.update(ordr_login, @user.first, @user.last)
    end
    @user.ordr_account_id = api_request['user_id']
    @user.save

  end


  def update_ordr_cc(cc)
    ordr_cc = credit_card(cc['name'], cc['expiry'][0], cc['expiry'][1], billing_address, cc['number'], cc['cvc'])

    request = $ordrin.user.set_credit_card(ordr_login, "cc1", ordr_cc)

    if request['msg'] == "Credit Card Saved"
      # @TODO hard coding cc1 as card nickname for now
      @user.card_nickname = "cc1"
    else
      @user.card_nickname = ""
    end
    @user.save

  end

end
