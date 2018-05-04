class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :body, :user_id, :user_name, :vote_total
  belongs_to :user
  belongs_to :museum
  has_many :votes

  # This is a function for later to identify the selected vote option on the review tile; it's breaking the tests.
  # def vote_value
  #   vote = object.votes.find_by(user: current_user) if current_user
  #   vote.value if vote
  # end


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
