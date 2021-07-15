require 'rails_helper'

RSpec.describe YelpRestaurant do
  it 'exists and has attributes' do
    incoming_info = {
            "id": "AKqb9TR9QdzJ1qdu8tkTzA",
            "alias": "hair-of-the-dog-eatery-virginia-beach-2",
            "name": "Hair of the Dog Eatery",
            "image_url": "https://www.yelp.com/biz/hair-of-the-dog-eatery",
            "is_closed": false,
            "url": "https://www.yelp.com/biz/hair-of-the-dog-eatery-virginia-beach-2?adjust_creative=LQcpiiWbMiKa340WkEG_8A&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=LQcpiiWbMiKa340WkEG_8A",
            "review_count": 879,
            "categories": [
                {
                    "alias": "tradamerican",
                    "title": "American (Traditional)"
                }
            ],
            "rating": 4.0,
            "coordinates": {
                "latitude": 36.8427236690082,
                "longitude": -76.1146234298266
            },
            "transactions": [
                "pickup",
                "delivery"
            ],
            "price": "$$",
            "location": {
                "address1": "4000 Virginia Beach Blvd",
                "address2": "Ste 210",
                "address3": "",
                "city": "Virginia Beach",
                "zip_code": "23452",
                "country": "US",
                "state": "VA",
                "display_address": [
                    "4000 Virginia Beach Blvd",
                    "Ste 210",
                    "Virginia Beach, VA 23452"
                ]
            },
            "phone": "+17573212200",
            "display_phone": "(757) 321-2200",
            "distance": 1693.9970493730857
        }
    restaurants = YelpRestaurant.new(incoming_info)

    expect(restaurants).to be_a(YelpRestaurant)
    expect(restaurants.id).to eq("AKqb9TR9QdzJ1qdu8tkTzA")
    expect(restaurants.name).to eq("Hair of the Dog Eatery")
    expect(restaurants.image).to eq("https://www.yelp.com/biz/hair-of-the-dog-eatery")
    expect(restaurants.rating).to eq(4.0)
    expect(restaurants.price).to eq("$$")
    expect(restaurants.address).to eq("4000 Virginia Beach Blvd, Ste 210, Virginia Beach, VA 23452")
    expect(restaurants.phone).to eq("(757) 321-2200")
  end
end
