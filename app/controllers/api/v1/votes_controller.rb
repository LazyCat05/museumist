class Api::V1::VotesController < ApiController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    data = JSON.parse(request.body.read)
    review = Review.find(data['review'])
    message = { id: 'message', body: '', vote_total: 0}
    posted_vote = Vote.new(value: data['value'], review_id: data['review'])
    posting_user = current_user
    if !posting_user
      message[:body] = "Please log in to vote."
    else
      posting_user.votes.each do |vote|
        if vote.review_id == posted_vote.review_id && vote.value == posted_vote.value
          message[:body] = "Your vote has already been recorded"
        elsif vote.review_id == posted_vote.review_id && vote.value != posted_vote.value
          vote.update_attribute(:value, posted_vote.value)
          message[:body] = "Your vote has been updated"
        end
      end
      if message[:body] == ''
        posted_vote.user = posting_user
        posted_vote.save
        message[:body] = 'Your vote has been recorded'
      end
    end
    review.votes.each do |vote|
      message[:vote_total] += vote.value
    end
    render json: message
  end
end
