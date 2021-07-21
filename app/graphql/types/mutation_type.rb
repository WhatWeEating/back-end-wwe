module Types
  class MutationType < Types::BaseObject
    field :create_restaurants, mutation: Mutations::CreateRestaurants
    field :update_restaurants, mutation: Mutations::UpdateRestaurants
  end
end
