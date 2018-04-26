class Review < ApplicationRecord
validates :body, presence: true, exclusion: { in: [nil] }
  validates_inclusion_of :raiting, :numericality => 1..5
end
