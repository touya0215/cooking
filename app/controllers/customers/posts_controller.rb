class Customers::PostsController < ApplicationController

  def create
    @post = current_customer.posts.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def new
    @post = Post.new
  end

  def index
  end

  def show
    @post = Post.new
    @posts = Post.find(params[:id])
  end

  def edit
    @posts = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:customer_id, :name, :image, :sentence, :genre)
  end

end
