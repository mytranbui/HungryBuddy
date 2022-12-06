class List < ApplicationRecord
  belongs_to :user

  has_many :bookmarks, dependent: :destroy
  has_many :foodplaces, through: :bookmarks
  acts_as_followable
  acts_as_favoritable
  # has_one_attached :photo

  validates :name, uniqueness: true, presence: true
end
