class ReviewsController < ApplicationController
  before_action :set_movie
  load_and_authorize_resource only: [:edit, :update, :destroy]
  def index
    @reviews = @movie.reviews.includes(:user)
  end

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = @movie.reviews.build(review_params)
    @review.user=current_user
    if @review.save
      redirect_to movie_reviews_path(@movie), notice: 'Review was successfully created.'
    else
      render 'new'
    end
  end
  def update
    @review=@movie.reviews.find(params[:id])
      if @review.update(review_params)
        redirect_to movie_reviews_path(@movie), notice: 'Review was successfully updated.'
      else
        redirect_to movie_reviews_path(@movie), notice: 'Review was not updated.'
      end
  end

  def destroy
    @review = @movie.reviews.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to movie_reviews_path, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
  def review_params
    params.require(:review).permit(:comment)
  end

end
