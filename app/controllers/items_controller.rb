class ItemsController < ApplicationController
  def rankings
    @items = Item.all
    @favorite_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
    @monthly_ranks = Item.find(OrderItem.where(created_at: 1.months.ago.beginning_of_day..Time.zone.now.end_of_day).group(:item_id).order('sum(amount) desc').limit(3).pluck(:item_id))
    @weekly_ranks = Item.find(OrderItem.where(created_at: 1.weeks.ago.beginning_of_day..Time.zone.now.end_of_day).group(:item_id).order('sum(amount) desc').limit(5).pluck(:item_id))
    @new_cd =Item.limit(6).order(" created_at DESC ")
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
      @items = merged_result | track
    else
      @items = Item.all
    end
    @cart_item = CartItem.new
  end
end