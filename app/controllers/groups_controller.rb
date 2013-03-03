class GroupsController < ApplicationController
  before_filter :authenticate_user!

  def index
    # raise params.inspect
    #@group_name = params['groupname']

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
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    # raise params.inspect
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      redirect_to groups_path, :notice => "You updated your group!"
    else
    end
  end

  # def destroy
  # end


    # find_or_create if found update the param else create the param
    # parms to create/update are address, special instructions
    # look at model and match the input names of the address & special instructions 


# - Update existing group (address, lunch time)
# - Delete group

end