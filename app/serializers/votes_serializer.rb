class VoteSerializer < ActiveModel::Serializer
  attributes :id, :value
  belongs_to :user
  belongs_to :review
end
