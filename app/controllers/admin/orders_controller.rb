class Admin::OrdersController < Admin::AdminApplicationsController

  PER = 9

  def index
    @orders = Order.page(params[:page]).per(PER)
  end

  def show
    @order = Order.find(params[:id])
  end
  def update
    order = Order.find(params[:id])
    order.status = params[:order][:status].to_i
    if order.save
      redirect_to admin_order_path(order.id)
    else
      @order = Order.find(params[:id])
      render :show
    end
  end
end
