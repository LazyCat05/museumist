class Admin::GenresController < AdminController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: "Genre Added!"
    else
      @errors = @genre.errors.full_messages
      render :index
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    if @genre.destroyable_by?(current_user)
      @genre.destroy
      flash[:notice] = "Genre has been deleted"
      redirect_to admin_genres_path
    end
  end

  protected

  def genre_params
    params.require(:genre).permit(:name)
  end
end
