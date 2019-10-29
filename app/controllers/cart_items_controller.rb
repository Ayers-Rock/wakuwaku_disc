class CartItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :destroy, :update]
  def create
    user_cart_item = current_user.cart_items.where(item_id: params[:cart_item][:item_id].to_i).first
    if user_cart_item
      @cart_item = user_cart_item
      amount = params[:cart_item][:amount].to_i + @cart_item.amount
      @cart_item.update(amount: amount)
      redirect_to user_cart_items_path(current_user.id)
    else
      @cart_item = CartItem.new
      @cart_item.user_id = current_user.id
      @cart_item.amount = params[:cart_item][:amount].to_i
      @cart_item.item_id = params[:cart_item][:item_id].to_i
        if @cart_item.save
          redirect_to user_cart_items_path(current_user.id)
        else
          @items = Item.page(params[:page]).per(10).reverse_order
          render 'items/index'
        end
    end
  end

  def destroy
    @item = CartItem.find(params[:id])
      @item.destroy
      redirect_to user_cart_items_path(current_user.id)
  end

  def update
    @cart_items = CartItem.where(user_id: current_user.id)
    @cart_items.each_with_index do |cart_item, i|

      if cart_item.update(amount: params[:amount][i.to_s])
      else
        @items = Item.page(params[:page]).per(10).reverse_order
        render 'items/index'
      end
      # binding.pry
      # @cart_item.amount = params[:cart_item][:amount].to_i
      # @cart_item.item_id = params[:cart_item][:item_id].to_i

    # if cart_item.update(amount: params[:amount][i.to_s])
    #   redirect_to new_order_path
    # else
    #   @items = Item.page(params[:page]).per(10).reverse_order
    #   render 'items/index'
    # end
    end
    redirect_to new_order_path
  end

  def index
    @cart_items = CartItem.where(user_id: current_user.id)
    if @cart_items.empty?
      redirect_to root_path
    end

  end

end
