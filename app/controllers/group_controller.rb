class GroupController < ApplicationController
  def index
    @group_name = params['groupname']
  end
end
