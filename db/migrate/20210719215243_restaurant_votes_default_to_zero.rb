class RestaurantVotesDefaultToZero < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :restaurants,
      :votes,
      0
    )
  end
end
