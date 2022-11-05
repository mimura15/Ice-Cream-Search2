class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_post, only: [:edit, :update, :destroy]

  def index
    @tag_list = Tag.all
    if params[:search].present?
      @posts = Post.where('title LIKE ?', "%#{params[:search]}%")
    elsif params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts.all
    elsif params[:shop_id].present?
      @shop = Shop.find(params[:shop_id])
      @posts = @shop.posts.all
    else
      @posts = Post.all
    end
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
    tag_list = params[:post][:tag_name].delete(' ').delete('　').split(',')
    if post.save
      post.save_tag(tag_list)
      redirect_to post_path(post)
    else
      @post = Post.new
      @shops = Shop.all
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @shops = Shop.all
    @tag_list = @post.tags.pluck(:tag_name).join(',')
  end

  def update
    @post = Post.find(params[:id])
    # redirect_to post_path(@post) unless @post.user_id == current_user.id
    tag_list = params[:post][:tag_name].delete(' ').delete('　').split(',')
    if @post.update(post_params)
      if params[:post][:image_ids]
        params[:post][:image_ids].each do |image_id|
          image = @post.images.find(image_id)
          image.purge
        end
      end
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id)
    else
      @shops = Shop.all
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    # if @post.user.id == current_user.id
      @post.destroy
      redirect_to posts_path
    # else
      # redirect_to post_path(@post)
    # end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :shop_id, tag_name: [], images: [])
  end

  def correct_post
    @post = Post.find(params[:id])
    unless @post.user.id == current_user.id
      redirect_to post_path(@post), alert: 'このページへは遷移できません'
    end
  end
end
