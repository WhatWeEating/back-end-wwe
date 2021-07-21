require 'rails_helper'

RSpec.describe Mutations::CreateRestaurants, type: :request do
  describe '.resolve' do
    it 'creates restaurants' do
      event = Event.create(uid: "Kareem O'Weet")
      expect(Restaurant.count).to eq(0)
      post '/graphql', params: { query: query }
      expect(Restaurant.count).to eq(3)
    end
  end 

  def query
    <<~GQL
    mutation {
      createRestaurants(input: {
        params: {
          first: {
            eventId: "Kareem O'Weet", yelpId: "00000", image: "website", address: "123 st", phone: "405648", name: "Cool Food"
          },
          second: {
            eventId: "Kareem O'Weet", yelpId: "1235460", image: "webpage", address: "123 st", phone: "405648", name: "Spicy Food"
          },
          third:{
            eventId: "Kareem O'Weet", yelpId: "60870asdf", image: "imageaddress", address: "123 st", phone: "405648", name: "Comfort Food"
          }
          }}) {
    restaurant {
      name
    	phone
      address

    }
  }
}
      GQL
  end
end
