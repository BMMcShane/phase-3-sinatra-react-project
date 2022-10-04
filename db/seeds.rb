puts "🌱 Seeding plants..."

plant_names = ["shelby, hypnotica, trilogy, vernicus, athena, whoville"]
plant_types = ["cactus", "aquatic", "shrub", "tree"]
plant_descriptions = ["this is a crazy cool plant and you would love to have the opportunity to harvest this one", "the other plants are cool but this one may be the coolest yet!"]
test_usernames = ["nessa", "ben", "nick", "admin"]


6.times do
    Plant.create(name: plant_names.sample, plot_location: 0, plant_type: plant_types.sample, price: rand(80..490), rarity: rand(0..10), description: plant_descriptions.sample)
end


5.times do
    Farmer.create(coins: 100, date: Date.new, username: test_usernames.sample, password: "password", plants: Plant.all.first)
end


puts "✅ Done seeding!"
