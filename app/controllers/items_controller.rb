class ItemsController < ApplicationController
  def rankings
  end

  def ranking
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
  end
end
