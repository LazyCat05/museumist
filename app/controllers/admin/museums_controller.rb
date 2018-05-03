class MuseumsController < AdminController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @museums = Museum.all
    @museum = Museum.new
  end

  def create
    @museum = Museum.new(museum_params)
    if @museum.save
      redirect_to admin_museums_path, notice: "Museum Added!"
    else
      @errors = @museum.errors.full_messages
      render :index
    end
  end

  def destroy
    @museum = Museum.find(params[:id])
    if @museum.destroyable_by?(current_user)
      @museum.destroy
      flash[:notice] = "Museum has been deleted"
      redirect_to admin_museums_path
    end
  end

  protected

  def genre_params
    params.require(:museum).permit(:name)
  end
end
