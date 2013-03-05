class OrdrAccountsController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @ordr_account = current_user.ordr_account
  end

  def update
    @ordr_account = current_user.ordr_account
    if @ordr_account.update_attributes(params[:ordr_account])
      redirect_to user_path, :notice => "You updated your account!"
    else
    end
  end

end

