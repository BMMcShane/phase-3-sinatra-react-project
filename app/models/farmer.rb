class Farmer < ActiveRecord::Base
    has_many :planted_plants, through: :farms
end


 # attr_reader (:username :password)
    #when farmer is initialized, unlocked and locked lists are initialized
    # def initialize(username, password, coins, unlocked_plants, locked_plants)
    #     @username = username
    #     @password = password
    #     @coins = 100,
    #     @unlocked_plants = ["grass"],
    #     @locked_plants = ["shelby", "hypnotica", "trilogy", "vernicus", "athena", "whoville"]
    # end