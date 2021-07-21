# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
2.times do
  event = Event.create(uid: Faker::FunnyName.name)

  event.restaurants.create(yelp_id: Faker::Games::Pokemon.name,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address,
    image: Faker::Avatar.image,
    votes: 3,
    name: Faker::JapaneseMedia::StudioGhibli.character)

  event.restaurants.create(yelp_id: Faker::Games::Pokemon.name,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address,
    image: Faker::Avatar.image,
    votes: 2,
    name: Faker::JapaneseMedia::StudioGhibli.character)

  event.restaurants.create(yelp_id: Faker::Games::Pokemon.name,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address,
    image: Faker::Avatar.image,
    votes: 1,
    name: Faker::JapaneseMedia::StudioGhibli.character)
end
