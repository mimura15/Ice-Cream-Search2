class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
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
