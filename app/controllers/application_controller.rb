class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'


  #returns a list of all of the users with the names of their planted plants
  get '/farmers' do 
    farmers = Farmer.all
    farmers.to_json
  end

  #returns the same information as /farmer for an individual farmer
  get "/farmers/:id" do
    farmer = Farmer.find_by(id: params[:id])
    farmer.to_json
  end

  
  #finds the farms for a given farmer id
  get '/farmers/:id/farms' do
    farm = Farm.find_by(farmer_id: params[:id])
    farm.to_json
  end

  
  #creates a list of the planted plants and corresponding data
  get '/farmers/:id/plants' do
    farmer = Farmer.find_by(id: params[:id])
    planted_plants = Farm.find_by(farmer_id: farmer.id)
    plants = planted_plants.match_plants
    plants.to_json
  end
  
  #gets coin count for individual farmer
  get '/farmers/:id/coins' do
    farmer = Farmer.find_by(id: params[:id])
    coins = farmer.match_coins
    coins.to_json
  end

  #update coins
  patch '/farmers/:id/coins' do
   User.find(params[:user_id]).update(coins: params[:coins]).to_json
  end
  

  

  #creates a list of all the plants in the Mill
  get '/plants' do 
    plants = Plant.all
    plants.to_json
  end

  #creates a string of the data for an individual plant
  get '/plants/:id' do 
    plants = Plant.find_by(params[:id])
    plants.to_json
  end

  #lists all of the planted plants in the mill
  get '/planted' do
    planted = PlantedPlant.all
    planted.to_json
  end


  #creates a list of the farms in MewMew's Mill
  get '/farms' do
    farms = Farm.all
    farms.to_json
  end

  #creates a string of the data for an individual farm
  get '/farms/:id' do 
    farms = Farm.find_by(params[:id])
    farms.to_json
  end

  #allows plants to be added with name, plot_location, and plant_id
  post "/farmers/:id/add_plant/:plant_id/:plot_location" do
    farmer = Farmer.find_by(params[:id])
    farm = Farm.find_by(farmer_id: params[:id])
    plant = Plant.find_by(params[:plant_id])
    planted = PlantedPlant.create(plot_location: rand(0..25), time_planted: Date.new, farm_id: farm.id, plant_id: plant.id)
    planted.to_json
  end

  #login functionality to make sure the same username cannot be reclaimed
  post "/login" do
    farmer = Farmer.find_by(username: params[:username])
    if farmer && farmer.password==(params[:password])
      return { farmer_id: farmer.id, message: "You Are Successfully Logged In!" }.to_json
    else
      return { farmer_id: 0, error: "Invalid Password" }.to_json
    end
  end

  #post for a new user to sign up
  post "/signup" do
    farmer = Farmer.find_by(username: params[:username])
    if farmer
      return(
        {
          farmer_id: 0,
          error: "this username is taken"
        }.to_json
      )
    else
      farmer =
        Farmer.create(
          username: params[:username],
          password: params[:password],
          coins: params[:coins],
          logged_in: true
        )
      return { farmer_id: farmer.id, message: "success" }.to_json
    end
  end

  #deleting a user
  delete "/farmers/:id/delete" do
    farmer = Farmer.find(params[:id])
    farmer.destroy
    farmer.to_json
  end
end
