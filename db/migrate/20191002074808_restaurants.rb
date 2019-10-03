class Restaurants < ActiveRecord::Migration[5.2]
  def change

    create_table :restaurants do |t|
      t.string :restaurants
      t.string :image
      t.string :name
      t.string :adress
      t.boolean :reserve
      t.string :camp
      t.timestamps null: false
      t.string :genre
    end

  end
end
