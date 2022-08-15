class Public::ReviewsController < ApplicationController
  def index
    @reviews = Review.where(shop_id:params[:shop_])
    @shop = Shop.find(params[:shop_id])
  end

  def show

  end

  def new
    @review = Review.new
    @shop = Shop.find(params[:shop_id])
  end

  def create
    review = current_user.review.build(review_params)
    if review.save
      redirect_to shop_review_path(review.id)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:shop_id, :title, :ice_name, :price, :feedback)
  end
end
