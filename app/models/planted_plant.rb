class PlantedPlant < ActiveRecord::Base
    belongs_to :plants
    belongs_to :farm
    #initialize the table parameters
    # def initialize (:plot_location, :plant_id, )
end