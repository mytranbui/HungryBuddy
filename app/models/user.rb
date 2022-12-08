class User < ApplicationRecord
  acts_as_favoritable
  acts_as_favoritor
  acts_as_followable
  acts_as_follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lists, dependent: :destroy
  has_many :reviews
  has_one_attached :photo

  validates :nickname, uniqueness: { case_sensitive: false }
  # has_many :friendships ??

  def all_saves
    Favorite.saved_list.where(favoritor_id: id)
  end

  def all_visits
    Favorite.visited_list.where(favoritor_id: id)
  end

  def all_faves
    Favorite.favorite_list.where(favoritor_id: id)
  end
end
