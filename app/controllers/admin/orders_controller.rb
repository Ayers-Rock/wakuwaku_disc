class Admin::OrdersController < Admin::AdminApplicationsController
  before_action :search_status, only: [:index]
  PER = 9

  def index
    unless params[:search].blank?
      u_first = Order.joins(:user).where("first_name LIKE ?", "%#{params[:search]}%")
      u_last = Order.joins(:user).where("last_name LIKE ?", "%#{params[:search]}%")
      d_last = Order.where("delivery_last_name LIKE ?", "%#{params[:search]}%")
      d_first = Order.where("delivery_first_name LIKE ?", "%#{params[:search]}%")
      number = Order.where("order_number LIKE ?", "%#{params[:search]}%")
      status = Order.where("status LIKE ?", "%#{params[:search]}%")
      a = u_first | u_last
      b = ( a | d_last )
      c = ( b | d_first )
      d = ( c | number )
      e = ( d | status )
      @orders = Kaminari.paginate_array(e).page(params[:page]).per(PER)
    else
      @orders = Order.with_deleted.page(params[:page]).per(PER)
    end
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
  def search_status
    if params[:search] == "配送準備中" || params[:search] == "準備中"
      params[:search] = 0
    elsif params[:search] == "配送中"
      params[:search] = 1
    elsif params[:search] == "配送完了" || params[:search] == "完了"
      params[:search] = 2
    end
  end
end
