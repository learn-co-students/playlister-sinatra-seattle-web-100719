require_relative '../app/models/artist'
require_relative '../app/models/song'
require_relative '../app/models/genre'
# Add seed data here. Seed your database with `rake db:seed`

a1 = Artist.create(name: "I AM AN ARTIST")

s1 = Song.create(name: "THIS IS MY SONG", artist_id: a1.id)

g1 = Genre.create(name: "GENRE ONE")
