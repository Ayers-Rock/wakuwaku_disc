class OrdersController < ApplicationController
  def new
    @cart_items = current_user.cart_items
  end

  def create
    @order = order.new
    @order.postal_code = params[id]
    @order.prefecture = params[id]
    @order.city_address = params[id]
    @order.building = params[id]
  end

  def show
  end

  def thanks

  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
