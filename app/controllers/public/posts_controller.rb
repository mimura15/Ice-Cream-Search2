class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @shop = @post.shop
  end

  def new
    @post = Post.new
    @shops = Shop.all
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      redirect_to post_path(post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :shop_id, images: [])
  end

end
