class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @items = Item.where(genre_id: @genre.id)
  end
end