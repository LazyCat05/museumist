class Api::V1::ReviewsController < ApiController
  skip_before_action :verify_authenticity_token, only: [:create]
  def index
    render json: Review.all
  end

  def create
    data = JSON.parse(request.body.read)
    error = { id: 'error message', body: ''}
    new_review = Review.new(body: data["body"], rating: data["rating"], museum_id: data["museum_id"])
    post_user = current_user
    if !post_user
      error[:body] = "Please log in to leave a review"
    else
      post_user.reviews.each do |review|
        if review.museum_id == new_review.museum_id
          error[:body] = "One review to a user, please!"
        end
      end
    end
    if error[:body] == ''
      new_review.user = post_user
    end
    if new_review.valid?
      new_review.save
      render json: new_review
    else
      render json: error
    end
  end
end
