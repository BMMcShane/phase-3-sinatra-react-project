class CreatePlantLists < ActiveRecord::Migration[6.1]
  def change
    create_table :plant_lists do |t|
      t.integer :farmer_id
      t.string :unlocked_plants  
      t.string :locked_plants
    end
  end
end
