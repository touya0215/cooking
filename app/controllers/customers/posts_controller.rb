class Customers::PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to post_path(@post[:id])
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
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :image, :sentence, :genre)
  end

end
