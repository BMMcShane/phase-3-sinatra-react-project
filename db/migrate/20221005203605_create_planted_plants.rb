class CreatePlantedPlants < ActiveRecord::Migration[6.1]
  def change
    create_table :planted_plants do |t|
      t.datetime :time_planted
      t.integer :farm_id
      t.integer :plant_id
    end
  end
end
