class Admin::OrdersController < Admin::AdminApplicationsControll
  
  PER = 8

  def index
    @order_items = Order.page(params[:page]).per(PER)
  end

  def show
  end
end
