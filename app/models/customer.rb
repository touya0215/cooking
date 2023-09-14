class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

  has_many :posts
  has_many :likes, dependent: :destroy #投稿が削除されるといいねも削除される。
  has_many :comments, dependent: :destroy #投稿が削除されるとコメントも削除される。
  
  def already_liked?(post) #今からいいねしようとしている投稿が存在しているのか確認。
    self.likes.exists?(post_id: post.id)
  end

end
