class Customers::CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.post_id = post.id
    @comment.save!
    # redirect_to post_path(params[:id])
    redirect_back(fallback_location: root_path) #前の画面に戻る
  end

  def show
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path) #前の画面に戻る
  end


  private

  def comment_params
    params.require(:comment).permit(:customer_id, :post_id, :sentence )
  end


end
