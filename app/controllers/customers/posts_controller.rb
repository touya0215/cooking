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
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:name, :image, :sentence, :genre)
  end

end
