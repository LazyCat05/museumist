class Genre < ApplicationRecord
 validates :name, presence: true, exclusion: { in: [nil] }

 has_many :museum_genres
 has_many :museums, through: :museum_genres
end
