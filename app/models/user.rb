class User < ApplicationRecord
  acts_as_favoritable
  acts_as_favoritor
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lists, dependent: :destroy
  has_many :reviews
  has_one_attached :photo
  # has_many :friendships ??

  def all_saved
    Favorite.saved_list.where(favoritor_id: id)
  end
end
