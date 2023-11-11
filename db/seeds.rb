# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
movies_data = [
  { title: 'Movie 1', description: 'Description 1', movie_length: 120, director: 'Director 1', genre: 'Action', release_date: Date.new(2022, 1, 1) },
  { title: 'Movie 2', description: 'Description 2', movie_length: 110, director: 'Director 2', genre: 'Comedy', release_date: Date.new(2022, 2, 1) },
# Add more movie data as needed
]

movies_data.each do |movie_data|
  Movie.create!(movie_data)
end