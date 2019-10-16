class Admin::OrdersController < Admin::AdminApplicationsController
  def index
    @order_items = Order.all
  end

  def show
  end
end
