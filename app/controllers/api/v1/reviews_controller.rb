class Api::V1::ReviewsController < ApiController
  skip_before_action :verify_authenticity_token, only: [:create]
  def index
    render json: Review.all
  end

  def create
    data = JSON.parse(request.body.read)
    new_review = Review.new(body: data["body"], rating: data["rating"], museum_id: data["museum_id"])
    post_user = current_user
    new_review.user = post_user
    if new_review.save
      render json: new_review
    else
      error = { id: "error message", body: "Please log in to leave a review"}
      render json: error
    end
  end
end
