class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @shop = @post.shop
    @post_tags = @post.tags
  end

  def new
    @post = Post.new
    @shops = Shop.all
  end

  def create
    post = current_user.posts.build(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    if post.save
      post.save_tag(tag_list)
      redirect_to post_path(post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @shops = Shop.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      if params[:post][:image_ids]
        params[:post][:image_ids].each do |image_id|
          image = @post.images.find(image_id)
          image.purge
        end
      end
      redirect_to post_path(@post.id)
    else
      @shops = Shop.all
      render :edit
    end
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
