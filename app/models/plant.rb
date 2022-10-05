class Plant < ActiveRecord::Base
    has_many :planted_plants
end