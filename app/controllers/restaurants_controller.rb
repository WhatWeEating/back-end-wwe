class RestaurantsController < ApplicationController

  before_action :valid?

  def index
    zip = params[:zip]
    event_id = request.headers[:HTTP_EVENT_ID]

    Event.create(uid: event_id)

    restaurants = RestaurantFacade.open_restaurants(zip)

    render json: RestaurantSerializer.new(restaurants)
  end

  private

  def valid?
    zip = params[:zip]
    if zip.present?
      if zip.split(',') == Array && zip.split(',').count == 2
        return true
      elsif zip.length == 5 && zip.to_i > 0
        return true
      end
    else
      invalid_params
    end
  end
end
