class Admin::OrdersController < Admin::AdminApplicationsController
  
  PER = 9

  def index
    @orders = Order.page(params[:page]).per(PER)
  end

  def show
    @order = Order.find(params[:id])
  end
end
