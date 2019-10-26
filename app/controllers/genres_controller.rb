class GenresController < ApplicationController
  def show
    @items = Item.where(genre_id: params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
    @labels = Label.all
  end
end