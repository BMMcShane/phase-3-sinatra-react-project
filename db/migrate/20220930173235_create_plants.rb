class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :plant_type
      t.integer :price
      t.integer :rarity
      t.string :description
      t.integer :plot_location
      t.integer :time_planted
      t.integer :farm_id
    end
  end
end
