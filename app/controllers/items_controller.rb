class ItemsController < ApplicationController
  respond_to :json

  def index
    @items = Item.all
    render :json => @items
  end

  def show
    @item = Item.find(params[:id])
    render :json => @item
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(params[:item])
    respond_with @item
  end
end
