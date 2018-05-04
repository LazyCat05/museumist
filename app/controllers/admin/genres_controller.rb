class Admin::GenresController < AdminController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_genre, only: [:edit, :update]

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def new
    @genre = Genre.new
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: "Your new genre #{@genre.name} was saved successfully."
    else
      @errors = @genre.errors.full_messages
      render :index
    end
  end

  def update
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: "#{@genre.name} was successfully updated."
    else
      @errors = @genre.errors.full_messages
      render :edit
    end
  end

  protected
  # Use callbacks to share common setup or constraints between actions.
  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
