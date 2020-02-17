# Add seed data here. Seed your database with `rake db:seed`

Artist.create(name: "RS")
Artist.create(name: "Regina Spektor")
Artist.create(name: "Jimmi Hendrix")
Artist.create(name: "Bob Dylan")

Genre.create(name: "folk")
Song.create(name: 'on the radio', artist_id: 1)

