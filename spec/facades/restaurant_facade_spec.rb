require 'rails_helper'

RSpec.describe RestaurantFacade do
  describe 'class methods' do
    describe '::open_restaurants' do
      it 'returns objects from search by zip results' do
        zip = 22304
        results = RestaurantFacade.open_restaurants(zip)

        expect(results).to be_an(Array)
        expect(results.size).to be > 0
        expect(results.size).to be <= 15

        restaurant = results[0]
        expect(restaurant.address).to be_a(String)
        expect(restaurant.id).to be_a(String)
        expect(restaurant.image).to be_a(String)
        expect(restaurant.name).to be_a(String)
        expect(restaurant.phone).to be_a(String)
        expect(restaurant.rating).to be_a(Float)
      end
    end
  end
end
