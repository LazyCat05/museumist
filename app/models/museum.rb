class Museum < ApplicationRecord
  validates :name, presence: true, exclusion: { in: [nil] }
  validates :location, presence: true, exclusion: { in: [nil] }

  has_many :museum_genres
  has_many :genres, through: :museum_genres
end
