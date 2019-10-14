class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
    @items = Items.where(artist_id: @artist.id)
  end
end
