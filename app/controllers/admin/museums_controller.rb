class Admin::MuseumsController < AdminController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_museum, only: [:edit, :update]

  def index
    @museums = Museum.all
    @museum = Museum.new
  end

  def new
    @museum = Museum.new
  end

  def edit
  end

  def create
    @museum = Museum.new(museum_params)
    @museum.founding_date = museum_params[:founding_date].to_date

    if @museum.save
      redirect_to admin_museums_path, notice: "Your new museum #{@museum.name} was saved successfully."
    else
      @errors = @museum.errors.full_messages
      render :index
    end
  end

  def update
    if @museum.update(museum_params)
      redirect_to admin_museums_path, notice: "#{@museum.name} was successfully updated."
    else
      @errors = @museum.errors.full_messages
      render :edit
    end
  end

  protected
  # Use callbacks to share common setup or constraints between actions.
  def set_museum
    @museum = Museum.find(params[:id])
  end

  def museum_params
    params.require(:museum).permit(:name, :location, :description, :founding_date, :url)
  end
end
