class FavoritesController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    favorite = current_user.favorites.new(item_id: item.id)
    # binding.pry
    favorite.save

    @items=Item.all
    # @item = favorite.
    @item = item
    @favorites = Favorite.where(user_id: current_user.id)
    @cart_item = CartItem.new
  end

  def destroy
    item = Item.find(params[:item_id])
    favorite = current_user.favorites.find_by(item_id: item.id)
    favorite.destroy

    @items = Item.all
    @item = item
    @favorites = Favorite.where(user_id: current_user.id)
    @cart_item = CartItem.new
  end

  def index
    @favorites = Favorite.where(user_id: current_user.id).reverse_order
    # @cart_items =
  end
end
