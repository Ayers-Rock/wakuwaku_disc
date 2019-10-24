class CartItemsController < ApplicationController
  def create
    if CartItem.find_by(item_id: params[:cart_item][:item_id].to_i)
      @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id].to_i)
      amount = params[:cart_item][:amount].to_i + CartItem.find_by(item_id: params[:cart_item][:item_id]).amount
      @cart_item.update(amount: amount)
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new
      @cart_item.user_id = current_user.id
      @cart_item.amount = params[:cart_item][:amount].to_i
      @cart_item.item_id = params[:cart_item][:item_id].to_i
        if @cart_item.save
          redirect_to cart_items_path
        else
          @items = Item.page(params[:page]).per(10).reverse_order
          render 'items/index'
        end
    end
  end

  def destroy
    @item = CartItem.find(params[:id])
      @item.destroy
      redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem.where(user_id: current_user.id)
    if @cart_items.empty?
      redirect_to root_path
    end
    
  end
end
