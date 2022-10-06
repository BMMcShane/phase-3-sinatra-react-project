puts "🌱 Seeding plants..."


#Farmers with extra coins to test features
nick =
    Farmer.create(username: "nick", password: "password", coins: 1000, unlocked_plants: "", locked_plants: "", logged_in: false)
ben =
    Farmer.create(username: "ben", password: "password", coins: 1000, unlocked_plants: "", locked_plants: "", logged_in: false)
nessa =
    Farmer.create(username: "nessa", password: "password", coins: 1000, unlocked_plants: "", locked_plants: "", logged_in: false)
admin = 
    Farmer.create(username: "admin", password: "password", coins: 1000, unlocked_plants: "", locked_plants: "", logged_in: false)
example = 
    Farmer.create(username: "example", password: "password", coins: 100, unlocked_plants: "", locked_plants: "", logged_in: false)

#Plants for the Plantopedia, and Shoppe
grass = Plant.create(name: "Grass", price: nil, description: "kickin' some grass")
succulent = Plant.create(name: "Succulent", price: nil, description: "DO NOT HARVEST")
venus = Plant.create(name: "Venus Fly Trap", price: 1, description: "hide your kids, hide your flies")
pizza = Plant.create(name: "Pizza Tree", price: 3, description: "Capt. McCrea would be proud")
space = Plant.create(name: "Space Plant!", price: 8, description: "straight from the vicinity of betelgeuse")
eyeball = Plant.create(name: "Eyeball Tree", price: 20, description: "blind faith")
hedge = Plant.create(name: "Hedge Fund", price: 25, description: "annoying plant bro from harvard")
fire = Plant.create(name: "Fire", price: 35, description: "avoid planting during dry season")
grass2 = Plant.create(name: "New Grass", price: 50, description: "kickin' some grass, but different")
bubble = Plant.create(name: "Bubble Bush", price: 55, description: "grows best in the bath")
lil = Plant.create(name: "F**ked Up Little Guy", price: 100, description: "your guess is as good as mine")
creeping = Plant.create(name: "Creeping dread", price: 401, description: "we all know it")

#creating a farm as well as grass for a user to start with 
Farmer.all.each do |farmer|
    1.times do
        Farm.create(farmer_id: farmer.id, farm_upgrade_level: 0, farmer_upgrade_level: 0)
    end
end

# nessa.match_farm do |farm|
#     farm.add_plant(1,1)
#     plant_name = Plant.find(plant_id: plant_id).name
#     plants = farm.match_plants
#     self.unlocked_plants << plant_name
# end

Farm.all.each do |farm|
    1.times do
        PlantedPlant.create(plot_location: 1, time_planted: Date.new, farm_id: farm.id, plant_id: 1)
    end
end



puts "✅ Done seeding!"




