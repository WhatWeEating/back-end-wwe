class RemoveIndexFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_index :restaurants, name: "index_restaurants_on_yelp_id"
  end
end
