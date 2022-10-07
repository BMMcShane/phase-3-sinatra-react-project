class Farmer < ActiveRecord::Base
    has_many :planted_plants, through: :farms
    
    def serialize_farmer
        farmer_hash = {
        "id" => self.attributes["id"],
        "username" => self.attributes["username"],
        "unlocked_plants" => self.attributes["unlocked_plants"],
        "coins" => self.attributes["coins"]
        }
    end

  

    # def match_name(username)
    #   username = {
    #     "username" => Farmer.find_by(username: self.username)
    # end

  #   def match_farms 
  #     farms = {
  #     "farm" => Farm.find_by(farmer_id: self.id)
  # }
  # end
    def afford?(plant_id)
        selected_plant = Plant.find(plant_id: plant_id)
        
        if selected_plant.price < self.coins
          return true
        else
          return false
        end
      end


    

end


    # def planted_plant?(farmer)
    #     planted_plant =
    #       self.planted_plants.find do |planted_plant|
    #         (planted_plant.admin_id == self.id || planted_plant.test_id == self.id) &&
    #           (planted_plant.admin_id == farmer.id || planted_plant.test_id == farmer.id)
    #       end
    #     if planted_plant
    #       return planted_plant
    #     else
    #       return false
    #     end
    #   end



#    