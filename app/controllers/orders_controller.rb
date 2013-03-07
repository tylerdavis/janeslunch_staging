class OrdersController < ApplicationController
  before_filter :authenticate_user!

  def create
    @item = Item.find(params['item'])
    @group_order = GroupOrder.find(params['groupOrder'])
    @order = Order.where(:user_id => current_user.id).first_or_create
    p @order
    @order.user = current_user
    @order.item = @item
    @order.tip = params['tip']
    @order.group_order = @group_order
    puts @order.inspect
    if @order.save
      redirect_to '/'
    else
      render :new
    end
  end

  def tray
    
  end

  def cancel_order
    
  end

end
