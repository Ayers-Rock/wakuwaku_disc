class Admin::StocksController < Admin::AdminApplicationsController
  def new
    @stock = Stock.new
    @item = Item.find_by(id: params[:format])
  end

  def index
  end

  def edit
  end

  def create
    @item = Item.find_by(id: params[:id])
    stock = Stock.new(stock_params)
    binding.pry
    stock.item_id = @item.id
    stock.save
    redirect_to admin_item_path(@stock.item.id)
  end

  def update
  end

  private
  def stock_params
    params.require(:stock).permit(:arrival_count, :arrival_date)
  end
end
