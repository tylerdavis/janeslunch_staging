class UserController < ApplicationController
  before_filter :authenticate_user!

  def index
    @invited_groups = []
    @invited_groups = PendingInvitations.where(:user_id => current_user.id)
    @pending =[]
    @invited_groups.each{|g| @pending << Group.find(g[:group_id])}

    if user_signed_in?
      @user = current_user
    end
  end

  def join
    current_user_update_attricute()
  end
  
  def ignore
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
      @user.update_ordr_account()
      @user.save
      redirect_to user_path, :notice => "You updated you!"
    else
      redirect_to user_path, :notice => "Something failed"
    end  
  end

  def update_cc
    @user = current_user
    @user.update_ordr_cc(params[:cc])
    @user.save
    redirect_to user_path, :notice => "Card updated!"
  end

end
