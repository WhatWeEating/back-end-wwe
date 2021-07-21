class RestaurantsController < ApplicationController

  before_action :valid?

  def index
    zip = params[:zip]
    event_id = request.headers[:HTTP_EVENT_ID]
    # worked for postman request TODO: remove if working as is
    # event_id = request.headers[:event_id]
    Event.create(uid: event_id)

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
