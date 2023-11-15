class Customers::HomesController < ApplicationController
  def top
    @posts = Post.all
  end

  def about
  end

  def search
    search_word = params[:word]
    search_count_word = params[:count_word]
    search_genre = params[:genre]
    genre_num = Post.genres[search_genre]
    # 料理名の検索機能
    # @posts = Post.where("name LIKE ? or sentence LIKE ? or genre = ?", "%#{search_word}%", "%#{search_count_word}%", genre_num)
    @posts = Post
    if params[:word]!=""
      @posts += @posts.where("name LIKE ?", "%#{search_word}%")
    end
    if params[:count_word]!=""
      @posts = @posts + @posts.where("sentence LIKE ?", "%#{search_count_word}%" )
    end
    if params[:genre]!=""
      @posts = @posts.where("genre = ?", genre_num)
    end
  end

end
