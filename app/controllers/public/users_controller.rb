class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @reviews = @user.reviews
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    if user.update(user_params)
      redirect_to user_path(user.id)
    else
      @user = current_user
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end

  def destroy
    @user = current_user
    @user.destroy
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :message, :image)
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(@user), alert: 'このページへは遷移できません'
    end
  end

end
