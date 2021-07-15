require 'rails_helper'

RSpec.describe RestaurantService do
  describe 'class methods' do
    describe '::fetch_open_restaurants' do
      it 'gets restaurants in zip code that are currently open' do
        zip = 23452
        results = RestaurantService.fetch_open_restaurants(zip)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:businesses)
        expect(results[:businesses]).to be_an(Array)
        expect(results[:businesses][0]).to be_a(Hash)
        expect(results[:businesses][0]).to have_key(:alias)
        expect(results[:businesses][0]).to have_key(:image_url)
        expect(results[:businesses][0]).to have_key(:is_closed)
        expect(results[:businesses][0][:is_closed]).to eq(false)
        expect(results[:businesses][0]).to have_key(:location)
        expect(results[:businesses][0]).to have_key(:distance)
      end
    end
  end
end
