class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :create, :destroy, :update, :thanks]
  def new
    # @cart_items = current_user.cart_items
    @cart_items = CartItem.where(user_id: current_user.id)
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)
    @cart_items = CartItem.where(user_id: current_user.id)
    if @order.save
      @order.update(order_number: @order.order_number)
      @cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.item_id = cart_item.item.id
        @order_item.amount = cart_item.amount
        @order_item.order_id = @order.id
        @order_item.purchase_price = cart_item.item.price
        @order_item.save
        cart_item.really_destroy!
      end
        redirect_to thanks_order_path(@order.id)
    else
      render 'new'
    end
  end

  def show
    @order = Order.with_deleted.find(params[:id])
    @order_items = @order.order_items
    render :show
  end

  def thanks
    @order_items = OrderItem.where(order_id: params[:id])
    @order = Order.find(params[:id])
  end

  def index
    @orders = current_user.orders
    render :index
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.user_id = current_user.id
    if order.update(order_update_params)
      redirect_to order_path(order.id)
    else
      @order = order
      render :edit
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.order_items.each do |order_item|
      if order.stock_status != 0
        order_item.item.status = 0
      end
    end
    order.destroy
    flash[:notice] = "注文のキャンセルを承りました。またのご利用をお待ちしております。"
    redirect_to orders_path
  end

  private
  def split_address(address)
    array = address.split
    { delivery_last_name: array[0], delivery_first_name: array[1], delivery_last_kana_name: array[2], delivery_first_kana_name: array[3], postal_code: array[4], prefecture: array[5], city_address: array[6], building: array[7]}
    # splitメソッドで区切って配列にする、デフォでスペースで区切ってくれるので今回引数はなし
  end

  def order_params
    case params[:address].to_i
    when 0
      address_data = { delivery_last_name: current_user.last_name, delivery_first_name: current_user.first_name, postal_code: current_user.postal_code, prefecture: current_user.prefecture, city_address: current_user.city_address, building: current_user.building}
      payment_data = {delivery_first_kana_name: current_user.first_kana_name, delivery_last_kana_name: current_user.last_kana_name, payment: params[:payment].to_i, total_price: current_user.cart_sum, postage: 500, status: 0}
    when 1
      address = params[:other_address]
      address_data = split_address(address)
      payment_data = { payment: params[:payment].to_i, total_price: current_user.cart_sum, postage: 500, status: 0}
    end

      address_data.merge(payment_data)
  end

  def order_update_params
    params.require(:order).permit(:delivery_last_name, :delivery_first_name, :delivery_last_kana_name, :delivery_first_kana_name, :postal_code, :city_address, :prefecture, :building)
  end

  def status
    
  end
end
