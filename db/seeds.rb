puts "🌱 Seeding plants..."


#Farmers with extra coins to test features
nick =
    Farmer.create(username: "nick", password: "password", coins: 100, logged_in: false)
ben =
    Farmer.create(username: "ben", password: "password", coins: 100, logged_in: false)
nessa =
    Farmer.create(username: "nessa", password: "password", coins: 100, logged_in: false)
admin = 
    Farmer.create(username: "admin", password: "password", coins: 100, logged_in: false)
example = 
    Farmer.create(username: "example", password: "password", coins: 100, logged_in: false)

#Plants for the Plantopedia, and Shoppe
grass = Plant.create(name: "Grass", price: nil, grow_time: 10)
succulent = Plant.create(name: "Succulent", price: 5000, grow_time: 1000000000000000)
venus = Plant.create(name: "Venus Fly Trap", price: 15, grow_time: 30)
pizza = Plant.create(name: "Pizza Tree", price: 50, grow_time: 90)
space = Plant.create(name: "Space Plant!", price: 100, grow_time: 180)
eyeball = Plant.create(name: "Eyeball Tree", price: 150, grow_time: 300)
hedge = Plant.create(name: "Hedge Fund", price: 300, grow_time: 600)
fire = Plant.create(name: "Fire", price: 50, grow_time: 45)
grass2 = Plant.create(name: "New Grass", price: nil, grow_time: 15)
bubble = Plant.create(name: "Bubble Bush", price: 500, grow_time: 1200)
lil = Plant.create(name: "F**ked Up Little Guy", price: 750, grow_time: 3600)
creeping = Plant.create(name: "Creeping dread", price: 1000, grow_time: 86400)

#creating a farm as well as grass for a user to start with 
Farmer.all.each do |farmer|
    1.times do
        Farm.create(farmer_id: farmer.id, farm_upgrade_level: 0, farmer_upgrade_level: 0)
    end
end

Farm.all.each do |farm|
    1.times do
        PlantedPlant.create(time_planted: Date.new, farm_id: farm.id, plant_id: 1)
    end
end



puts "✅ Done seeding!"




