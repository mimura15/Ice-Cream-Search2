class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @shops = Shop.all
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to post_path(post.id)
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

  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :shop_id, images: [])
  end

end
