# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying tables..."
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

puts "Resetting primary keys..."
ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('artworks')
ApplicationRecord.connection.reset_pk_sequence!('artworkshares')

puts "Creating users..."
kenny = User.create(username: "KN")
rocco = User.create(username: "Rocstar")
chris = User.create(username: "nice_guy")
paolo = User.create(username: "fancy_man")
mike = User.create(username: "pure_evil")

puts "Creating artworks..."
mona_lisa = Artwork.create(title: "mona lisa", image_url: "https://www.wikiart.org/en/leonardo-da-vinci/mona-lisa", artist_id: 1)
starry_night = Artwork.create(title: "starry night", image_url: "https://en.wikipedia.org/wiki/The_Starry_Night", artist_id: 2)
last_supper = Artwork.create(title: "last supper", image_url: "https://en.wikipedia.org/wiki/The_Last_Supper_(Leonardo)", artist_id: 3)
the_kiss = Artwork.create(title: "the kiss", image_url: "https://en.wikipedia.org/wiki/The_Kiss_(Klimt)", artist_id: 4)
pearl_earing = Artwork.create(title: "pearl earing", image_url: "https://en.wikipedia.org/wiki/Girl_with_a_Pearl_Earring", artist_id: 1)
night_watch = Artwork.create(title: "night watch", image_url: "https://en.wikipedia.org/wiki/The_Night_Watch", artist_id: 2)

puts "Creating artworkshares..."
share1 = ArtworkShare.create(artwork_id: 1, viewer_id: 2)
share2 = ArtworkShare.create(artwork_id: 2, viewer_id: 5)
share3 = ArtworkShare.create(artwork_id: 1, viewer_id: 5)
share4 = ArtworkShare.create(artwork_id: 4, viewer_id: 3)
share5 = ArtworkShare.create(artwork_id: 3, viewer_id: 1)
share6 = ArtworkShare.create(artwork_id: 2, viewer_id: 1)
share7 = ArtworkShare.create(artwork_id: 4, viewer_id: 2)


puts "Creating comments..."
comment1 = Comment.create(body: 'KN is dope', author_id: 1, artwork_id: 1)
comment2 = Comment.create(body: 'Rocstar need help', author_id: 2, artwork_id: 2)
comment3 = Comment.create(body: 'Mike is so evil', author_id: 2, artwork_id: 3)
comment4 = Comment.create(body: 'Paolo is so fancy', author_id: 3, artwork_id: 4)
comment5 = Comment.create(body: 'mike is not that evil', author_id: 4, artwork_id: 5)
comment6 = Comment.create(body: 'KN is awesome', author_id: 3, artwork_id: 1)
comment7 = Comment.create(body: 'what is this CRUD', author_id: 4, artwork_id: 1)
comment8 = Comment.create(body: 'error comment', author_id: 9, artwork_id: 23433)


puts "finished seeding"
