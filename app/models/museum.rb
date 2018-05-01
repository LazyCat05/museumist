class Museum < ApplicationRecord
  validates :name, presence: true, exclusion: { in: [nil] }
  validates :location, presence: true, exclusion: { in: [nil] }

  has_many :reviews
end
