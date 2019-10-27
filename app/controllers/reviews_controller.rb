class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @item = Item.find(params[:item_id])
    @review.item_id = @item.id
    @review.user_id = current_user.id
    if @review.save
      redirect_to item_path(params[:item_id])
    else
      @cart_item = CartItem.new
      @reviews = Review.where(item_id: @item.id)
      render template: 'items/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :body)
  end
end
