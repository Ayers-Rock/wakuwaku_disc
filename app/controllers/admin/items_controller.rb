class Admin::ItemsController < Admin::AdminApplicationsController
  def index
  end

  def edit
  end

  def new
    @item = Item.new
    @disc = @item.discs.build
    @track = @disc.tracks.build
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def destroy
  end

  def update
  end


  private
  def item_params
    params.require(:items).permit(:artist, :genre, :label, :title, :jacket_image_id, :price, :status, discs_attributes: [:id, :disc_number, tracks_attributes: [:id, :track_number, :track_name]])
  end
end