class Customers::HomesController < ApplicationController
  def top
    @posts = Post.all
  end

  def about
  end
  
  def search
    search_word = params[:word]
    @posts = Post.where("name LIKE ?", "%#{search_word}%")
  end
  
end
