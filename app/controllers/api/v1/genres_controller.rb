class Api::V1::GenresController < ApiController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    render json: { genres: Genre.all }
  end

  def show
    # render json: { genre: Genre.find(params[:id]) }
    render json: Genre.find(params[:id]), serializer: GenreShowSerializer
  end

end
