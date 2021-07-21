require 'rails_helper'

RSpec.describe Queries::FetchEvent, type: :request do
  describe '.resolve' do
    it 'returns an event with its restaurants' do
      @event = Event.create(uid: "123lol00")
      expect(@event.restaurants.size).to eq(0)

      @joes = @event.restaurants.create(name: "Joe's", event_id: @event.uid, yelp_id: "dksiejfha")
      @mels = @event.restaurants.create(name: "Mel's", event_id: @event.uid, yelp_id: "lsoseutnks")
      @cals = @event.restaurants.create(name: "Cal's", event_id: @event.uid, yelp_id: "aoieurlhaskd")
      post '/graphql', params: { query: query }
      expect(@event.restaurants.size).to eq(3)

      result = JSON.parse(response.body, symbolize_names: true)

      ranked_restaurants = result[:data][:fetchEvent][:restaurants]

      expect(ranked_restaurants).to be_an(Array)
      expect(ranked_restaurants[0][:name]).to eq(@joes.name)
      expect(ranked_restaurants[1][:name]).to eq(@mels.name)
      expect(ranked_restaurants[2][:name]).to eq(@cals.name)
    end
  end

  def query
    <<~GQL
    { fetchEvent(uid: "#{@event.uid}") {
  uid
  restaurants {
    name
    yelpId
  }
}

}
      GQL
  end
end
