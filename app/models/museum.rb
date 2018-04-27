class Museum < ApplicationRecord
  validates :name, presence: true, exclusion: { in: [nil] }
  validates :location, presence: true, exclusion: { in: [nil] }
end
 
