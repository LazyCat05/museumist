class Museum < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true

  has_many :museum_genres
  has_many :genres, through: :museum_genres
  has_many :reviews
  has_many :museum_genres
  has_many :genres, through: :museum_genres
end
