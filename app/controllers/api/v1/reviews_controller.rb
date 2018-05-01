class Api::V1::ReviewsController < ApiController
  def index
    render json: Review.all
  end
end
