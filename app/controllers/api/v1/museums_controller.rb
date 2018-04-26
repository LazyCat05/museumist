class Api::V1::MuseumsController < ApiController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    render json: { museums: Museum.all }
  end

  def show
    render json: { museum: Museum.find(params[:id]) }
  end

  # def create
  #   fortune = Fortune.new(text: params[:fortune])
  #   if fortune.save
  #     render json: { fortune: fortune }
  #   else
  #     render json: { error: fortune.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end
end
