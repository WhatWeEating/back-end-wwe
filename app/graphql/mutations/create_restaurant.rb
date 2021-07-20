module Mutations
  class CreateRestaurant < BaseMutation

    field :restaurant, Types::RestaurantType, null: false
    field :errors, [String], null: false
    argument :event_id, String, required: true

    # argument :name, String, required: true, description: "Required string type field with the name of the restaurant."
    argument :image, String, required: false, description: "Not required string type field with a url to the restaurant's image."
    argument :phone, String, required: true, description: "Required string type field with the phone number of the restaurant."
    argument :address, String, required: true, description: "Required string type field with the full address of the restaurant."
    argument :yelp_id, String, required: true, description: "Required string type field with the full address of the restaurant."
    # argument :votes, Integer, required: false, description: "Not required integer type field with the points per restaurant post-ranking."

    def resolve(event_id: event_id, yelp_id: yelp_id, image: image, address: address, phone: phone)
      restaurant = Restaurant.new(event: Event.find_by(uid: event_id), yelp_id: yelp_id, image: image, address: address, phone: phone)

      if restaurant.save
        {
          restaurant: restaurant,
          errors: []
        } else {
          restaurant: nil,
          errors: restaurant.errors.full_messages
        }
      end
    end
  end
end
