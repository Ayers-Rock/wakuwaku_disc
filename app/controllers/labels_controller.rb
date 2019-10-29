class LabelsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def show
    @items = Item.where(label_id: params[:id]).page(params[:page]).per(20).reverse_order
    @cart_item = CartItem.new
    @genres = Genre.all
    @labels = Label.all
    @item = Label.find(params[:id])
  end
end
