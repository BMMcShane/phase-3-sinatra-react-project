class CreatePlantLists < ActiveRecord::Migration[6.1]
  def change
    create_table :plant_lists do |t|
      t.integer :farmer_id
      t.array :unlocked_plants  
      t.array :locked_plants
    end
  end
end
