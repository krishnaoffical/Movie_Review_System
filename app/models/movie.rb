class Movie < ApplicationRecord
  has_one_attached :image
  has_many :reviews,dependent: :destroy
  has_many :ratings,dependent: :destroy


  scope :highest_rated_first, -> { order(ratings_count: :desc,average_rating: :desc) }
  scope :released_between, -> (start_date, end_date) { where(release_date: start_date..end_date) }
  scope :search_by_title, ->(search_term) { where("title LIKE ?", "%#{search_term}%") }
  def update_average_rating
    update_columns(average_rating: ratings.average(:rating_value))
  end

end
