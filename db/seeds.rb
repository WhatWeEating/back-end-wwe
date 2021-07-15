# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
event = Event.create(uid: Faker::FunnyName.name)

event.restaurants.create(yelp_id: Faker::Games::Pokemon.name, votes: 3)
event.restaurants.create(yelp_id: Faker::Games::Pokemon.name, votes: 2)
event.restaurants.create(yelp_id: Faker::Games::Pokemon.name, votes: 1)
