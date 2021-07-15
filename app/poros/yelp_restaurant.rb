class YelpRestaurant
  attr_reader :id,
              :name,
              :image,
              :rating,
              :price,
              :address,
              :phone

  def initialize(info)
    @id = info[:id]
    @name = info[:name]
    @image = info[:image_url]
    @rating = info[:rating]
    @price = info[:price]
    @address = info[:location][:display_address].join(', ')
    @phone = info[:display_phone]
  end
end
