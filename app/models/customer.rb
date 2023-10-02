class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :posts, dependent: :destroy #アカウントが削除されると投稿も削除される。
  has_many :likes, dependent: :destroy #アカウントが削除されるといいねも削除される。
  has_many :comments, dependent: :destroy #アカウントが削除されるとコメントも削除される。

  def already_liked?(post) #今からいいねしようとしている投稿が存在しているのか確認。
    self.likes.exists?(post_id: post.id)
  end

end
