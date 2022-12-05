class Foodplace < ApplicationRecord
  acts_as_favoritable
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :name, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
