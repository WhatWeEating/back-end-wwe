module Types
  class RestaurantType < Types::BaseObject
    field :id, ID, null: false
    field :event, Types::EventType, null: false
    field :yelp_id, String, null: true
    field :votes, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
