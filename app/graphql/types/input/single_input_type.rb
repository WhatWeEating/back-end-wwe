module Types
  module Input
    class SingleInputType < Types::BaseInputObject
      argument :event_id, String, required: false
      argument :yelp_id, String, required: true
      argument :image, String, required: true
      argument :address, String, required: true
      argument :phone, String, required: true
      argument :name, String, required: false
    end
  end
end
