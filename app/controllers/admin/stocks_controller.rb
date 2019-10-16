class Admin::StocksController < Admin::AdminApplicationsController
  def new
    @stock = Item.find(params[:id])
  end

  def index
  end

  def edit
  end

  def create
  end

  def update
  end
end
