class Admins::CommentsController < ApplicationController

  def index
  end

  def destroy
    @comment = Comment.find_by(post_id: params[:post_id])
    @comment.destroy
    # redirect_to admins_posts_path
    redirect_back(fallback_location: root_path) #前の画面に戻る
  end

end
