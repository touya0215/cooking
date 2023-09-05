class Customers::HomesController < ApplicationController
  def top
    @posts = Post.all
  end

  def about
  end

  def search
    search_word = params[:word]
    search_genre = params[:genre]
    genre_num = Post.genres[search_genre]
    # 料理名の検索機能
    @posts = Post.where("name LIKE ? and genre = ?", "%#{search_word}%", genre_num)
  end

end
