class Farm < ActiveRecord::Base
    belongs_to :farmer
    has_many :planted_plants, through: :farmer
    # has_many :plants, 


    def add_grass(plot_location, plant_id)
        unlocked_grass = PlantedPlant.create(plot_location: plot_location, farm_id: self, time_planted: Date.new, plant_id: plant_id)
    end
    
    def match_plants 
        planted_plants = {
        "planted_plants" => PlantedPlant.where(farm_id: self.id)
    }
    end

    
    def add_plant(plant_id, plot_location)
        plant = Plant.where(plant_id: plant_id)
        PlantedPlant.create(plot_location: plot_location, time_planted: Date.new, farm_id: self, plant_id: plant_id)
        {
          "name" => plant.attributes["name"],
          "id" => plant.attributes["id"]
        }.to_json
    end



end