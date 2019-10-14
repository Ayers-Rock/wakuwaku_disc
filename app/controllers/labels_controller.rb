class LabelsController < ApplicationController
  def show
    @label = Label.find(params[:id])
    @items = Item.where(label_id: @label.id)
  end
end
