class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
validates :name,  uniqueness: true, length: { minimum: 2, maximum: 20 }
validates :introduction, length: { maximum: 50 }


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

   has_many :books, dependent: :destroy
   attachment :profile_image
end