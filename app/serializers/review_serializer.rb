class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :body, :user_id, :user_name, :vote_total, :vote_value
  belongs_to :user
  belongs_to :museum
  has_many :votes

  def vote_value
    vote = object.votes.find_by(user: current_user) if current_user
    vote.value if vote
  end


  def vote_total
    total = 0
    object.votes.each do |vote|
      total += vote.value
    end
    return total
  end

  def user_name
    object.user.username
  end
end
