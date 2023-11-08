class RenameRatingToGenreInMovies < ActiveRecord::Migration[6.1]
  def change
    rename_column :movies, :rating, :genre
  end
end
