class CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.user_id = current_user.id
    if @cart_item.save
    redirect_to cart_items_path
    else
      @items = Item.all
    render 'items/index'
    end
  end

  def destroy
  end

  def index
    @cart_items = CartItem.where(user_id: current_user.id)
    # s@cart_items = current_user.cart_items
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
