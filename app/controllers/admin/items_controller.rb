class Admin::ItemsController < ApplicationController
  def index
  end

  def edit
  end

  def new
  end

  def show
  end

  def destroy
  end

  def update
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end
end
