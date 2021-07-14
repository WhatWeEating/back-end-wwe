class RestaurantsController < ApplicationController
  def index
    zip = params[:zip]
    restaurants = RestaurantFacade.open_restaurants(zip)
    render json: RestaurantSerializer.new(restaurants)
  end
end
