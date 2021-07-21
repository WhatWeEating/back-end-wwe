module Types
  module Input
    class SingleInputType < Types::BaseInputObject
      argument :event_id, String, required: true
      argument :yelp_id, String, required: true
      argument :image, String, required: false
      argument :address, String, required: false
      argument :phone, String, required: false
      argument :name, String, required: false
    end
  end
end
