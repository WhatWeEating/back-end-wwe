module Queries
  class FetchEvent < Queries::BaseQuery  ## named FetchEvent because Event is already a model so this was less confusing
    type Types::EventType, null: false
    argument :uid, String, required: true

    def resolve(uid:)
      Event.find_by(uid: uid)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Event does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end