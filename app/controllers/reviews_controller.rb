class ReviewsController < ApplicationController
  def create
    review = Review.new(review_params)
    review.item_id = Item.find(params[:id])
    current_user = review.user_id
    review.save
    redirect_to item_path(params[:id])
  end

  private
  def review_params
    params.require(:review).permit(:title, :body)
  end
end
