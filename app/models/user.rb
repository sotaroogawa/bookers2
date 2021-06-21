class User < ApplicationRecord
 validates :name,  uniqueness: true, length: { minimum: 2, maximum: 20 }
 validates :introduction, length: { maximum: 50 }

 devise :database_authenticatable, :registerable,:recoverable, :rememberable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image
end
