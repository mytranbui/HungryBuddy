class List < ApplicationRecord
  belongs_to :user

  has_many :bookmarks, dependent: :destroy
  has_many :foodplaces, through: :bookmarks
  # has_one_attached :photo

  validates :name, uniqueness: true, presence: true
end
