class LikesController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
    @like = @review.likes.build()
    @like.user=current_user
    @like.liked=true
    if @like.save
      flash[:notice] = 'Liked the review'
    else
      flash[:alert] = 'Failed to like the review'
    end
    redirect_to movie_reviews_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
    @like = @review.likes.build()
    @like.user=current_user
    @like.liked=false
    if @like.save
      flash[:notice] = 'Unliked the review'
    else
      flash[:alert] = 'Failed to like the review'
    end
    redirect_to movie_reviews_path(@movie)
  end

end
