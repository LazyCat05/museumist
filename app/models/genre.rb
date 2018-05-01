class Genre < ApplicationRecord
 validates :name, presence: true

 has_many :museum_genres
 has_many :museums, through: :museum_genres
end
