class Api::V1::MuseumsController < ApiController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    render json: { museums: Museum.all }
  end

  def show
    render json: Museum.find(params[:id]), serializer: MuseumShowSerializer
  end
end
