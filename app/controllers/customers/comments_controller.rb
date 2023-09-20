class Customers::CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = current_customer.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end

  def show
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end


  private

  def comment_params
    params.require(:comment).permit(:customer_id, :post_id, :sentence )
  end


end
