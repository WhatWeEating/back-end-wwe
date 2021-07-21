module Types
  module Input
    class RestaurantInputType < Types::BaseInputObject
      argument :first, Types::Input::SingleInputType, required: true
      argument :second, Types::Input::SingleInputType, required: true
      argument :third, Types::Input::SingleInputType, required: true
    end
  end
end
