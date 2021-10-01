class RestaurantFacade
  class << self
    def open_restaurants(zip)
      restaurants = RestaurantService.fetch_open_restaurants(zip)[:businesses]

      restaurants.map do |dining|
        YelpRestaurant.new(dining)
      end
    end
  end
end
