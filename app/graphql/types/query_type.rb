module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :event, [Types::EventType], null: false,
      description: "Returns an event by ID"
    argument :id, ID, required: true ## TODO: fully implement that it takes argument
    def event(id)
      binding.pry
      Event.all
    end
  end
end
