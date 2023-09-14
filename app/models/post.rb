class Post < ApplicationRecord

  belongs_to :customer
  has_many :likes, dependent: :destroy #投稿が削除されるといいねも削除される。

  has_one_attached :image

  enum genre: { noodles: 1, main_dish: 2, side_dish: 3, rice_bowls: 4, dessert: 5 }

  def self.search(keyword)
    # タグ名の検索機能
    where("facility_name LIKE ?", "%#{keyword}%")
  end

end
