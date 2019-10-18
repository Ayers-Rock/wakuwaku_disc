class Admin::OrdersController < Admin::AdminApplicationsController
  
  PER = 9

  def index
    @order = Order.all
    @orders = Order.page(params[:page]).per(PER)
  end

  def show
  end
end
