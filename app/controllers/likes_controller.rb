class LikesController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
    @like = @review.likes.build(like_params)
    @like.user=current_user
    # @like.liked=true
    if @like.save
      flash[:notice] = 'Liked the review'
    else
      flash[:alert] = 'Failed to like the review'
    end
    redirect_to movie_reviews_path(@movie)
  end

  private
  def like_params
    params.permit(:liked)
  end
end
