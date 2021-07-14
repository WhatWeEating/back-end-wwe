class RestaurantFacade
  class << self
    def open_restaurants(zip)
      restaurants = RestaurantService.fetch_open_restaurants(zip)
      binding.pry
    end
  end
end
