class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.references :event, foreign_key: true
      t.string :yelp_id
      t.integer :votes

      t.timestamps
    end

    add_index :restaurants, :yelp_id, unique: true
  end
end
