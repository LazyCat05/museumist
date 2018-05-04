class Api::V1::MuseumsController < ApiController
  protect_from_forgery unless: -> { request.format.json? }

  # passing `scope` in so that the serializer has access to the current user (see MusumShowSerializer)
  serialization_scope :current_user

  def index
    render json: { museums: Museum.all }
  end

  def show
    render json: Museum.find(params[:id]), serializer: MuseumShowSerializer
  end
end
