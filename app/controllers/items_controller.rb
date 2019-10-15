class ItemsController < ApplicationController
  def rankings
  end

  def ranking
  end

  def show
  end

  def index
    @items = Item.all
  end
end
