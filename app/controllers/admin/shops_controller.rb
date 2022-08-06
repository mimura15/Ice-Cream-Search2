class Admin::ShopsController < ApplicationController
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

  end

  def update

  end

  def destroy

  end

  private

  def shop_params
    params.require(:shop).permit(:image, :name, :address, :telepone, :facsimile, :open_time, :close_time, :off_day, :website)
  end

end
