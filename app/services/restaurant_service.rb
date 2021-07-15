class RestaurantService
  class << self
    def fetch_open_restaurants(zip)
      resp = conn.get("/v3/businesses/search") do |faraday|
        faraday.params["location"] = zip
        faraday.params["categories"] = "restaurant"
        faraday.params["limit"] = 15
        faraday.params["open_now"] = true
      end
      parse_json(resp)
    end

    private

    def conn
      Faraday.new(url: 'https://api.yelp.com') do |faraday|
        faraday.headers['Authorization'] = "Bearer #{ENV['FOOD_KEY']}"
      end
    end

    def parse_json(resp)
      JSON.parse(resp.body, symbolize_names: true)
    end
  end
end
