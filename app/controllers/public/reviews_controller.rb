class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_review, only: [:edit, :update]

  def index
    @reviews = Review.where(shop_id:params[:shop_id])
    @shop = Shop.find(params[:shop_id])
  end

  def show
    # @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:id])
    @shop = @review.shop
    @comment = Comment.new
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
      @review = Review.new
      @shop = Shop.find(params[:shop_id])
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
      @review = Review.find(params[:id])
      @shop = @review.shop
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.user.id == current_user.id
      @review.destroy
      redirect_to shop_reviews_path(params[:shop_id])
    else 
      redirect_to shop_reviews_path(params[:shop_id])
    end
  end

  private

  def review_params
    params.require(:review).permit(:shop_id, :title, :ice_name, :price, :feedback, :rate)
  end
  
  def correct_review
    @review = Review.find(params[:id])
    unless @review.user.id == current_user.id
      redirect_to shop_review_path(params[:shop_id], @review.id), alert: 'このページへは遷移できません'
    end
  end
end
