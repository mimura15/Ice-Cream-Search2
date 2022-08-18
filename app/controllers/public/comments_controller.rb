class Public::CommentsController < ApplicationController
  def create
    review = Review.find(params[:review_id])
    comment = current_user.comments.new(comment_params)
    comment.review_id = review.id
    comment.save
    redirect_to shop_review_path(review, params[:shop_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
