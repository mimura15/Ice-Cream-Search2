class Public::PostsController < ApplicationController
  def index

  end

  def show
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

  end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :content, images: [])
  end

end
