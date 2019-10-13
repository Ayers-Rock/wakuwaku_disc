class Admin::ItemsController < ApplicationController
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
    @item = Item.find(params[:id])
  end

  def destroy
  end

  def update
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

private
  def item_params
    params.require(:item).permit(:price, jacket_image, title, artist_attributes: [:id, :artist_name],
    label_attributes: [:id, :label_name], genre_attributes: [:id, :genre_name],
    discs_attributes: [:id, :discnumber, :_destroy],tracks_attributes: [:id, :track_number, :track_name, :_destroy])
  end
  # レコード消した時に一緒に消えるようにでdestroyするのか？artist＿nameなどそのもの自体が一個消えちゃうから消さないのか？
end


