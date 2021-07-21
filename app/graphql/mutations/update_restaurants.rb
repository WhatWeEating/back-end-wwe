module Mutations
  class UpdateRestaurants < Mutations::BaseMutation
    argument :params, Types::Input::RestaurantInputType, required: true

    field :restaurant, [Types::RestaurantType], null: true
    field :errors, [String], null: true

    def resolve(params:)
      restaurant_params = Hash(params)
      event = Event.find_by(uid: restaurant_params[:first][:event_id])

      first = Restaurant.where(event: event, yelp_id: restaurant_params[:first][:yelp_id]).first
      second = Restaurant.where(event: event, yelp_id: restaurant_params[:second][:yelp_id]).first
      third = Restaurant.where(event: event, yelp_id: restaurant_params[:third][:yelp_id]).first
      # binding.pry
      first.votes = first.votes +=3
      second.votes = second.votes +=2
      third.votes = third.votes +=1

      first.save
      second.save
      third.save

      restaurants = [first, second, third]

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
