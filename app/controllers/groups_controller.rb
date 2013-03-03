class GroupsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @group_name = params['groupname']
  end

  def new
    @group = Group.new
  end

  def create
    if user_signed_in?
      @group = Group.new(params[:group])
      if @group.save
        redirect_to groups_path, :notice => "You created a new group!"
      else
        render "new"
      end  
    end
  end

  def show
    @group = Group.where(:name => params['groupname']).first
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      redirect_to groups_path, :notice => "You updated your group!"
    else
    end
  end
end