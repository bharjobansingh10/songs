# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
require 'faker'

# Create artists
10.times do
  Artist.create(name: Faker::Music.band)
end

# Create albums
Artist.all.each do |artist|
  5.times do
    artist.albums.create(title: Faker::Music.album)
  end
end

# Create songs
Album.all.each do |album|
  10.times do
    album.songs.create(title: Faker::Music::GratefulDead.song, duration: rand(180..600))
  end
end
