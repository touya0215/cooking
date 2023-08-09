class Post < ApplicationRecord
  
  belongs_to :customer

  has_one_attached :image

  enum genre: { noodles: 1, main_dish: 2, side_dish: 3, rice_bowls: 4 }

end
