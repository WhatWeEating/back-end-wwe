class AddColumnsToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :image, :string
    add_column :restaurants, :phone, :string
    add_column :restaurants, :address, :string
  end
end
