class ReviewsController < ApplicationController
  def create
    review = Review.new(review_params)
    item = Item.find(params[:item_id])
    review.item_id = item.id
    review.user_id = current_user.id
    review.save
    redirect_to item_path(params[:item_id])
  end

  private
  def review_params
    params.require(:review).permit(:title, :body)
  end
end
