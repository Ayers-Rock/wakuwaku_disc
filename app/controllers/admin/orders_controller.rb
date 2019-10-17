class Admin::OrdersController < Admin::AdminApplicationsController
  
  PER = 10

  def index
    @orders = Order.page(params[:page]).per(PER)
  end

  def show
  end
end
