class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :movie,counter_cache: true

  after_save :update_movie_average_rating
  after_destroy :update_movie_average_rating

  validates :user, uniqueness: { scope: :movie, message: "You've already rated this movie." }
  validates :rating_value, presence: { message: "Rating value cannot be be empty" }

  def update_movie_average_rating
    movie.update_average_rating
  end
end
