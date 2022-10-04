class Admin::ShopsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    shop = Shop.new(shop_params)
    if shop.save
      redirect_to admin_shop_path(shop.id)
    else
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to admin_shop_path(@shop.id)
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to admin_shops_path
  end

  private

  def shop_params
    params.require(:shop).permit(:image, :name, :address, :telepone, :facsimile, :open_time, :close_time, :off_day, :website, :latitude, :longitude)
  end

end
