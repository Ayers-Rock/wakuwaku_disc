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

    # @favorites.each do |favorite|
    #   @favorite = Favorite.new
    #   @favorite.user_id = favorite.user.id
    #   @favorite.item_id = favorite.item.id
    #   @favorite.save
    # end

    @cart_item = CartItem.new
  end

  def destroy
    item = Item.find(params[:item_id])
    favorite = current_user.favorites.find_by(item_id: item.id)
    favorite.destroy

    @items = Item.all
    @item = item
    @favorites = Favorite.where(user_id: current_user.id)

    # @favorites.each do |favorite|
    #   @favorite.user_id = favorite.user.id
    #   @favorite.item_id = favorite.item.id
    #   @favorite.destroy
    # end

    @cart_item = CartItem.new
  end

  def index
    # @favorites = Favorite.where(user_id: current_user.id).reverse_order
    @favorites = current_user.favorite_items
    # @cart_items =
  end
end
