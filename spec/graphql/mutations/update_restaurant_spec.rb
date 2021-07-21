require 'rails_helper'

RSpec.describe Mutations::UpdateRestaurants, type: :request do
  describe '.resolve' do
    xit 'updates restaurants votes' do
      event = Event.create(uid: "Kareem O'Weet")
      post '/graphql', params: { query: query }

      response = JSON.parse(response.body)

      expect(Restaurant.count).to eq(3)
    end
  end

  def query
    <<~GQL
    mutation {
      updateRestaurants(input: {
        params: {
          first: {
            eventId: "Kareem O'Weet", yelpId: "Trying"
      },
          second: {
            eventId: "Kareem O'Weet", yelpId: "TO GET"
      },
          third: {
            eventId: "Kareem O'Weet", yelpId: "Dat Payload"
      }
    }
  }) {
    restaurant {
    	yelpId
      votes
      name
    }
  }
}
      GQL
  end
end
