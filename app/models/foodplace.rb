class Foodplace < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :name, :address, presence: true
end
