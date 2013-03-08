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
    @group = Group.find(params[:id])
    @group.users << current_user
    @groupstatus = PendingInvitations.where(:user_id => current_user.id, :group_id => params[:id]).first
    @groupstatus.update_attributes(:user_id => nil, :group_id => nil)
    redirect_to user_root_path, :notice => "Success!"
  end
  
  def ignore
    @groupstatus = PendingInvitations.where(:user_id => current_user.id, :group_id => params[:id]).first
    @groupstatus.update_attributes(:user_id => nil, :group_id => nil)
    redirect_to user_root_path, :notice => "Group ignored"
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
      redirect_to '/u', :notice => "You updated your profile!"
    else
      redirect_to '/u', :notice => "Something failed"
    end  
  end

  def update_cc
    @user = current_user
    @user.update_ordr_cc(params[:cc])
    @user.save

    respond_to do |format|  
     format.js  
    end  

  end

end
