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
    @user = @post.user
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

end
