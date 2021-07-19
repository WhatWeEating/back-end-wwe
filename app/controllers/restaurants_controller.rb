class RestaurantsController < ApplicationController

  before_action :valid?

  def index
    zip = params[:zip]

    restaurants = RestaurantFacade.open_restaurants(zip)

    render json: RestaurantSerializer.new(restaurants)
  end

  private

  def valid?
    zip = params[:zip]
    if zip.nil? || zip.size != 5
      invalid_params
    else zip.length == 5 && zip.to_i > 0
      return true
    end
  end
end
