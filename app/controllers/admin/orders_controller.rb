class Admin::OrdersController < Admin::AdminApplicationsController

  PER = 9

  def index
    @orders = Order.with_deleted.page(params[:page]).per(PER)
  end

  def show
    @order = Order.find(params[:id])
  end
end
