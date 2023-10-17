class Admins::PostsController < ApplicationController

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
    @post = Post.find(params[:id])
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:name, :sentence, :genre)
  end

end
