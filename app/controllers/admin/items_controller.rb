class Admin::ItemsController < Admin::AdminApplicationsController
  def index
    @items = Item.page(params[:page]).per(10).reverse_order
    # TODO:.orderで表示順序を変える可能性有り
  end

  def edit
  end

  def new
    @item = Item.new
    @disc = @item.discs.build
    # @track = @disc.tracks.build
  end

  def show
    @item = Item.find(params[:id])
    @discs = Disc.where(item_id: @item.id)
    # @tracks = Track.where(disc_id: @discs.id).order(track_number: "DESC")
    # TODO:@discsに入ってる複数idを一つずつ渡すか、配列のままviewで渡してviewで処理するのかを調べるところからスタート
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
    params.require(:item).permit(:artist_id, :genre_id, :label_id, :title, :jacket_image, :price, :status, discs_attributes: [:id, :disc_number,:_destroy, tracks_attributes: [:id, :track_number, :track_name, :_destroy]])
  end
end