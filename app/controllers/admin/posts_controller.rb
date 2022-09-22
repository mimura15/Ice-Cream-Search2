class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @posts = @user.posts.all
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:id])
  end

  def update

  end

  def destroy

  end

end
