class CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(user_id)
    @cart_item.user_id = current_user.id
    if @cart_item.save
    redirect_to cart_items_path
    else
    #@cart_item = 
    render 'items/index'
    end
  end

  def destroy
  end

  def index
    @cart_items = CartItem.where(user_id: current_user.id)
    # s@cart_items = current_user.cart_items
  end
end
