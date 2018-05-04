class Review < ApplicationRecord
validates :body, presence: true, exclusion: { in: [nil] }
validates_inclusion_of :rating, :in => 1..5

belongs_to :museum
belongs_to :user
has_many :votes
end
