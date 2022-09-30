class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.integer :plot_location
      t.string :plant_type
      t.integer :time_planted
      t.integer :farm_id
    end
  end
end
