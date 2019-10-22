class ItemsController < ApplicationController
  def rankings
  end

  def ranking
    @items = Item.all
    # @all_ranks = Item.find(favorite.group(:item_id).order('count(item_id)desc').limit(20).plack(item_id)
  end

  def show
    @item = Item.find(params[:id])
    # @user = User.find(params[:id])
    @cart_item = CartItem.new
    @reviews = Review.where(item_id: @item.id)
    @review = Review.new
  end

  def index
    unless params[:search].blank?
      @artist = Item.joins(:artist).where("artist_name LIKE ?", "%#{params[:search]}%")
      @track =  Item.joins(discs: :tracks).where("track_name LIKE ?", "%#{params[:search]}%")
      @title = Item.where("title LIKE ?", "%#{params[:search]}%")
      @merged_result = @artist | @title
      @items = @merged_result | @track
    else
      @items = Item.all
    end
    @cart_item = CartItem.new
  end


end
    