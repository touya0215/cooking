class Like < ApplicationRecord
  belongs_to :customer
  belongs_to :post
  
  validates :post_id, uniqueness: { scope: :customer_id }#１投稿に１ユーザーは１いいねまでの設定
  
end
