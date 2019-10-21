class ItemsController < ApplicationController
  def rankings

  end

  def ranking
    @items = Item.all
    # @all_ranks = Item.find(favorite.group(:item_id).order('count(item_id)desc').limit(20).plack(item_id)

      # @monthly_ranks = Item.find(OrderItem.where(item_id: item.id).sum(:amount).group(:item_id).order(amount: "desc")).where(created_at: 1.month.ago.beginning_of_day..Time.zone.now.end_of_day)
    # binding.pry
    @monthly_ranks = OrderItem.where(created_at: 1.days.ago.beginning_of_day..Time.zone.now.end_of_day).group(:item_id).sum(:amount).sort_by{ | k, v | v }.reverse
      # @monthly_ranks = OrderItem.where(created_at: 1.days.ago.beginning_of_day..Time.zone.now.end_of_day).group(:item_id).order('sum(:amount) desc')
  end

  def show
    @item = Item.find(params[:id])
    # @user = User.find(params[:id])
    @cart_item = CartItem.new
    @reviews = Review.where(item_id: @item.id)
    # binding.pry
    @review = Review.new
  end

  def index
    @items = Item.all
    @cart_item = CartItem.new
  end


end
