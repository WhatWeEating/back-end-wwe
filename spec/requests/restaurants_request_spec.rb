require 'rails_helper'

RSpec.describe 'Fetch Open Restaurants by Zip' do
  describe 'Happy Path' do
    it 'endpoint exists and returns array of restaurants' do
      zip = 22304

      get "/restaurants?zip=#{zip}"

      expect(response).to be_successful

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to have_key(:data)
      data = body[:data]
      expect(data).to be_an(Array)

      object = data[0]

      expect(object.size).to eq(3)
      expect(object).to have_key(:id)
      expect(object[:id]).to be_a(String)
      expect(object).to have_key(:type)
      expect(object[:type]).to be_a(String)
      expect(object).to have_key(:attributes)
      expect(object[:attributes]).to be_a(Hash)

      attributes = object[:attributes]
      expect(attributes.size).to eq(6)

      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to be_a(String)
      expect(attributes).to have_key(:image)
      expect(attributes[:image]).to be_a(String)
      expect(attributes).to have_key(:rating)
      expect(attributes[:rating]).to be_a(Float)
      expect(attributes).to have_key(:price)
      expect(attributes[:price]).to be_a(String)
      expect(attributes).to have_key(:address)
      expect(attributes[:address]).to be_a(String)
      expect(attributes).to have_key(:phone)
      expect(attributes[:phone]).to be_a(String)
    end
  end
end
