class OrdersController < ApplicationController
  def new
    # @cart_items = current_user.cart_items
    @cart_items = CartItem.where(user_id: current_user.id)
    @order = Order.new
  end

  def create
    order = current_user.orders.build(order_params)
    order.save
    @cart_items = CartItem.where(user_id: current_user.id)
    @cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.item_id = cart_item.item.id
      @order_item.amount = cart_item.amount
      @order_item.order_id = order.id
      @order_item.purchase_price = cart_item.item.price
      @order_item.save
      # cart_item.destroy
    end
    redirect_to thanks_order_path(order.id)
  end

  def show
  end

  def thanks
    @order_items = OrderItem.where(order_id: params[:id])
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def split_address(address)
    array = address.split
    { postal_code: array[0], prefecture: array[1], city_address: array[2], building: array[3]}
    # splitメソッドで区切って配列にする、デフォでスペースで区切ってくれるので今回引数はなし
  end

  def order_params
    case params[:address].to_i
    when 0
      address = current_user.address
    when 1
      address = params[:other_address]
    else
      address = ''
    end
    # if params[:address] == "0"
    #   address = current_user.address
    # elsif params[:address] == "1"
    #   address =
    # else
    #   address = ''
      address_data = split_address(address)
      payment_data = {payment: params[:payment], total_price: current_user.cart_sum, postage: 500, status: 0}
      address_data.merge(payment_data)


  end


end
