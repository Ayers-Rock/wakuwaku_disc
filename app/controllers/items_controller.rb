class ItemsController < ApplicationController
  def rankings
  end

  def ranking
    @items = Item.all
    # @all_ranks = Item.find(favorite.group(:item_id).order('count(item_id)desc').limit(20).plack(item_id)
  end

  def show
    @item = Item.find(params[:id])
    # @user = User.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    @items = Item.all
    @cart_item = CartItem.new
  end

  
end
