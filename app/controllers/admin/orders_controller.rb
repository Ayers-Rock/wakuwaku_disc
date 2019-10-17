class Admin::OrdersController < Admin::AdminApplicationsController
  def index
    @orders = Order.all
  end

  def show
  end

  private
  def cart_item_params
    params.require(:cart_item)
  end
end
