class Customers::CommentsController < ApplicationController

  def create
    comment = current_customer.comments.new(comment_params)
    comment.post_image_id = post.id
    comment.save
    redirect_to post_path(params[:id])
  end

  def show
  end


  private

  def comment_params
    params.require(:comment).permit(:customer_id, :post_id, :sentence )
  end


end
