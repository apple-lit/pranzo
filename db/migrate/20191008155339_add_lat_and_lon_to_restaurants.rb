class AddLatAndLonToRestaurants < ActiveRecord::Migration[5.2]
  def change

      add_column :restaurants, :lat, :float
      add_column :restaurants, :lon, :float

  end
end
