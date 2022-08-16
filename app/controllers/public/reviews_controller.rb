class Public::ReviewsController < ApplicationController
  def index
    @reviews = Review.where(shop_id:params[:shop_id])
    @shop = Shop.find(params[:shop_id])
  end

  def show
    @review = Review.find(params[:id])
    @shop = Shop.find(params[:shop_id])
  end

  def new
    @review = Review.new
    @shop = Shop.find(params[:shop_id])
  end

  def create
    # pp "ほげ",current_user, user_signed_in?
    review = current_user.reviews.build(review_params)
    shop_id = params[:shop_id] #shop_review_pathのidを揃えるために記述、必ず必要な文ではない(params[:shop_id],review.id)でも大丈夫
    if review.save
      redirect_to shop_review_path(shop_id,review.id)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @shop = Shop.find(params[:shop_id])
  end

  def update
    @review = Review.find(params[:id])
    shop_id = params[:shop_id]
    if @review.update(review_params)
      redirect_to shop_review_path(shop_id, @review.id)
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:shop_id, :title, :ice_name, :price, :feedback)
  end
end
