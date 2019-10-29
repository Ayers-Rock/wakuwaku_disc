class Admin::ItemsController < Admin::AdminApplicationsController


  def index
    unless params[:search].blank?
      artist = Item.joins(:artist).where("artist_name LIKE ?", "%#{params[:search]}%")
      track =  Item.joins(discs: :tracks).where("track_name LIKE ?", "%#{params[:search]}%")
      title = Item.where("title LIKE ?", "%#{params[:search]}%")
      merged_result = artist | title
      @items = (merged_result | track)
      @items = Kaminari.paginate_array(@items).page(params[:page]).per(10)
    else
      @items = Item.page(params[:page]).per(10).reverse_order
    end
    # TODO:.orderで表示順序を変える可能性有り
  end

  def edit
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @disc = @item.discs.build
    # @track = @disc.tracks.build
  end
  def show
    @item = Item.find(params[:id])
    @discs = Disc.where(item_id: @item.id)
    @reviews = Review.where(item_id: @item.id)
    # @tracks = Track.order(track_number: "DESC")
    # TODO:@discsに入ってる複数idを一つずつ渡すか、配列のままviewで渡してviewで処理するのかを調べるところからスタート
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path

  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to  admin_item_path(params[:id])
  end


  private
  def item_params
    params.require(:item).permit(:artist_id, :genre_id, :label_id, :title, :jacket_image, :price, :status, discs_attributes: [:id, :disc_number,:_destroy, tracks_attributes: [:id, :track_number, :track_name, :_destroy]])
  end
end
