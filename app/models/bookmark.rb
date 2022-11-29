class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :foodplace

  validates :list, :foodplace, presence: true
  validates :foodplace, uniqueness: { scope: :list }
end
