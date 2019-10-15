class OrdersController < ApplicationController
  def new
    @user = current_user
    @cart_items = @user.cart_item
  end

  def create
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
