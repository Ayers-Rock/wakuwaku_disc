class Admin::StocksController < Admin::AdminApplicationsController

  def new
    @stock = Stock.new
    @item = Item.find(params[:item_id])
  end

  def index
    @stocks = Stock.page(params[:page]).per(10).reverse_order
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def create
    item = Item.find(params[:item_id])
    stock = Stock.new(stock_params)
    stock.item_id = item.id
    stock.save
    redirect_to admin_item_path(item.id)
  end

  def update
    stock = Stock.find(params[:id])
    stock.update(stock_params)
    redirect_to admin_item_path(stock.item.id) and return
    stock.status = params[:stock][:status].to_i
    if stock.save
      redirect_to admin_item_path(stock.item.id)
    else
      @stock = Stock.find(params[:id])
      render :edit
    end
  end

  private
  def stock_params
    params.require(:stock).permit(:arrival_count, :arrival_date)
  end
end
