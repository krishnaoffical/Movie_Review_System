class AddAverageRatingToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :average_rating, :float
  end
end
