class MuseumGenre < ApplicationRecord
  validates :museum_id, exclusion: { in: [nil] }
  validates :genre_id, exclusion: { in: [nil] }
  belongs_to :museum
  belongs_to :genre
end
