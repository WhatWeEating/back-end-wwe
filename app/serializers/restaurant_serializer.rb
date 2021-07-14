class RestaurantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image, :rating, :price, :address, :phone

  event = Event.create(uid: SecureRandom.base58(8))
  
  set_type "#{event.id}"
end
