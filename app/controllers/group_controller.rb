class GroupController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @group_name = params['groupname']
  end

  def create
    if user_signed_in?
      @group = Group.new(:name => params['create_groupname'])
      @group.save
    end
  end

end
