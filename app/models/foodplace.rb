class Foodplace < ApplicationRecord
  acts_as_favoritable
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :name, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average_rating
    all_ratings = self.reviews.pluck(:rating).compact
    if all_ratings.count == 0
      all_ratings = 0
    else
    (all_ratings.sum / all_ratings.count).round(1)
    end
  end
end
