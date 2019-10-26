class Admin::ArtistsController < Admin::AdminApplicationsController
  def new
    @artist = Artist.new
    @artists = Artist.all
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
    redirect_to new_admin_artist_path
    else
      # @artist = Artist.new(artist_params)
      @artists = Artist.all
      render :new
    end
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to new_admin_artist_path
  end

  private
  def artist_params
    params.require(:artist).permit(:artist_name)
  end
end
