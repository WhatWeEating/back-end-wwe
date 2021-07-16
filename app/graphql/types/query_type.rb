module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :fetch_event, resolver: Queries::FetchEvent #tells what query field and where it is defined
    # TODO: remove me
    # field :event, [Types::EventType], null: false,
    #   description: "Returns an event by ID"
    # def event
    #   Event.all
    # end  ## Discuss with Diana about whether to delete this
  end
end
