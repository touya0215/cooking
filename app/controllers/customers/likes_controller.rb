class Customers::LikesController < ApplicationController

  def create
    @like = current_customer.likes.create(post_id: params[:post_id])
    @like.save
    redirect_back(fallback_location: root_path) #前の画面に戻る
  end


  def destroy
    @post = Post.find(params[:post_id])
    @like = current_customer.likes.find_by(post_id: @post.id)
    @like.destroy
    redirect_back(fallback_location: root_path) #前の画面に戻る
  end

  def index
  end

end
