class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:rankings, :ranking, :index, :show]
  PER = 20

  def rankings
    @slide_jackets = Item.all.order(created_at: :desc).limit(10)
    @favorite_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
    @monthly_ranks = Item.find(OrderItem.where(created_at: 1.months.ago.beginning_of_day..Time.zone.now.end_of_day).group(:item_id).order('sum(amount) desc').limit(3).pluck(:item_id))
    @weekly_ranks = Item.find(OrderItem.where(created_at: 1.weeks.ago.beginning_of_day..Time.zone.now.end_of_day).group(:item_id).order('sum(amount) desc').limit(5).pluck(:item_id))
    @new_cd =Item.order(created_at: :desc).limit(6)
  end

  def ranking
    # binding.pry
    @favorite_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(20).pluck(:item_id))
    @monthly_ranks = Item.find(OrderItem.where(created_at: 1.months.ago.beginning_of_day..Time.zone.now.end_of_day).group(:item_id).order('sum(amount) desc').limit(20).pluck(:item_id))
    @weekly_ranks = Item.find(OrderItem.where(created_at: 1.weeks.ago.beginning_of_day..Time.zone.now.end_of_day).group(:item_id).order('sum(amount) desc').limit(20).pluck(:item_id))
    @cart_item = CartItem.new
  end

  def show
    @item = Item.find(params[:id])
    @discs = Disc.where(item_id: @item.id)
    # @user = User.find(params[:id])
    @cart_item = CartItem.new
    @reviews = Review.where(item_id: @item.id)
    @review = Review.new
  end

  def index
    unless params[:search].blank?
      artist = Item.joins(:artist).where("artist_name LIKE ?", "%#{params[:search]}%")
      track =  Item.joins(discs: :tracks).where("track_name LIKE ?", "%#{params[:search]}%")
      title = Item.where("title LIKE ?", "%#{params[:search]}%")
      merged_result = artist | title
      @items = (merged_result | track)
      @items = Kaminari.paginate_array(@items).page(params[:page]).per(20)
    else
      @items = Item.page(params[:page]).per(PER)
    end
    @cart_item = CartItem.new
    # @artists = Artist.all
    @labels = Label.all
    @genres = Genre.all

  end
end
