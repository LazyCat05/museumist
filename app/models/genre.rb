class Genre < ApplicationRecord
 validates :name, presence: true, exclusion: { in: [nil] }
end
