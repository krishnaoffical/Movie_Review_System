class RatingsController < ApplicationController
  before_action :set_movie
  load_and_authorize_resource only: [:edit, :update, :destroy]
  def index
    @ratings=@movie.ratings.includes(:user)
  end

  def show
    @rating=@movie.ratings.find(params[:id])
  end

  def new
    @rating=@movie.ratings.new
  end

  def edit
    @rating= @movie.ratings.find(params[:id])
  end
  def create
    @rating = @movie.ratings.build(rating_params)
    @rating.user=current_user
    if @rating.save
      redirect_to movie_ratings_path(@movie), notice: "Rating was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params)
      redirect_to movie_ratings_path(@movie), notice: "Rating was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @rating = @movie.ratings.find(params[:id])
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to movie_ratings_path, notice: "Rating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_movie
    @movie=Movie.find(params[:movie_id])
  end

  def rating_params
    params.require(:rating).permit(:rating_value)
  end

end
