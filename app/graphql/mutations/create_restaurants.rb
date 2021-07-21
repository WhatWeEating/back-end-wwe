module Mutations
  class CreateRestaurants < Mutations::BaseMutation
    argument :params, Types::Input::RestaurantInputType, required: true

    field :restaurant, [Types::RestaurantType], null: false
    field :errors, [String], null: false

    def resolve(params:)
      restaurant_params = Hash(params)

      event = Event.find_by(uid: restaurant_params[:first][:event_id])
      restaurants = restaurant_params.map do |k,v|
        event.restaurants.create(v)
      end

      if restaurants.present?
        {
          restaurant: restaurants,
          error: []
        } else {
          restaurants: [],
          errors: restaurant.errors.full_messages
        }
      end
    end
  end
end
