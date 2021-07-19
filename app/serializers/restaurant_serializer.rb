class RestaurantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image, :rating, :price, :address, :phone
end
