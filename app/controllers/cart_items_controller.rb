class CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(user_id)
    @cart_item.user_id = current_user.id
    if @cart_item.save
    redirect_to cart_items_path
    else
<<<<<<< HEAD
=======
      @items = Item.all
>>>>>>> master
    render 'items/index'
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
