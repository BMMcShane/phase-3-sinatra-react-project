class Farm < ActiveRecord::Base
    belongs_to :farmer
    has_many :planted_plants
    # has_many :plants, through: :farmer
end