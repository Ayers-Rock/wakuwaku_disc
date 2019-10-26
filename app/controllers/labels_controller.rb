class LabelsController < ApplicationController
  def show
    @items = Item.where(label_id: params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
    @labels = Label.all
  end
end
