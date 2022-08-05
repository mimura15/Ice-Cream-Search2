class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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

  def withdraw
    @user = current_user
    @user.update(is_active: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :message, :image)
  end
end
