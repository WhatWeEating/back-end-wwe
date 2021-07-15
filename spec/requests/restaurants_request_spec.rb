require 'rails_helper'

RSpec.describe 'Fetch Open Restaurants by Zip' do
  describe 'Happy Path' do
    it 'endpoint exists and returns array of restaurants' do
      zip = 22304

      get "/restaurants?zip=#{zip}"

      expect(response).to be_successful 
    end
  end
end
