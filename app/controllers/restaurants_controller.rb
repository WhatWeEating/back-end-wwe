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

    return true if zip.present? &&
      zip.length == 5 &&
      zip.to_i > 0
    invalid_params
  end
end
