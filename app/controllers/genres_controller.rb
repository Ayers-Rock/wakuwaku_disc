class GenresController < ApplicationController
  def show
    @items = Item.where(genre_id: params[:id]).page(params[:page]).per(20).reverse_order
    @cart_item = CartItem.new
    @genres = Genre.all
    @labels = Label.all
    @item = Genre.find(params[:id])
  end
end