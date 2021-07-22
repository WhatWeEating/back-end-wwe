require 'rails_helper'

RSpec.describe Mutations::UpdateRestaurants, type: :request do
  describe '.resolve' do
    it 'updates restaurants votes' do
      @event = Event.create(uid: "NewEvent ID")
      @joes = @event.restaurants.create(name: "Joe's 3rd", event_id: @event.uid, yelp_id: "dksiejfha")
      @mels = @event.restaurants.create(name: "Mel's 1st", event_id: @event.uid, yelp_id: "lsoseutnks")
      @cals = @event.restaurants.create(name: "Cal's 2nd", event_id: @event.uid, yelp_id: "aoieurlhaskd")

      expect(@joes.votes).to eq(0)
      expect(@mels.votes).to eq(0)
      expect(@cals.votes).to eq(0)

      post '/graphql', params: { query: query }

      result = JSON.parse(response.body, symbolize_names: true)
      ranked_restaurants = result[:data][:updateRestaurants][:restaurant]

      expect(ranked_restaurants[0][:votes]).to eq(3)
      expect(ranked_restaurants[1][:votes]).to eq(2)
      expect(ranked_restaurants[2][:votes]).to eq(1)
    end
  end

  def query
    <<~GQL
    mutation {
      updateRestaurants(input: {
        params: {
          first: {
            eventId: "#{@event.uid}", yelpId: "#{@mels.yelp_id}"
      },
          second: {
            eventId: "#{@event.uid}", yelpId: "#{@cals.yelp_id}"
      },
          third: {
            eventId: "#{@event.uid}", yelpId: "#{@joes.yelp_id}"
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
