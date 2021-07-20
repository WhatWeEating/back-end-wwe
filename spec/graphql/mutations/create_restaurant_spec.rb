require 'rails_helper'

RSpec.describe Mutations::CreateRestaurant, type: :request do
  # describe '.resolve' do
#     it 'creates restaurants' do
#       expect(Restaurant.count).to eq(0)
#       post '/graphql', params: { query: query }
#       expect(Restaurant.count).to eq(3)
#     end
#
#     it 'returns a restaurant' do
#       post '/graphql', params: { query: query }
#       response = JSON.parse(response.body)
#       data = response['data']
#       # expect(data['restaurant']['name']).to eq() # let FE know this is not in their mock data
#       expect(data['restaurant']['event_id']).to eq()
#       expect(data['restaurant']['vote']).to eq()
#       expect(data['restaurant']['address']).to eq()
#       expect(data['restaurant']['phone']).to eq()
#     end
#   end
#
#   def query # test is still not working!
#     <<~GQL
#     mutation {
#   createRestaurant(input: {eventId: "Joe King", yelpId: "1a2b3c4d567j89z", image:"urlhere", address: "123 st", phone:"405648"}) {
#     restaurant {
#       id
#     }
#   }
# }
#       GQL
#   end
end
