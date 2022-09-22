class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @reviews = @user.reviews.all
    else
      @reviews = Review.all
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def update

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path
  end
end
