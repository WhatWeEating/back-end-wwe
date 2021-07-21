module Types
  class MutationType < Types::BaseObject
    field :create_restaurants, mutation: Mutations::CreateRestaurants
  end
end
