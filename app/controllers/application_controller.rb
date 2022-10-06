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

  get '/farmers/:id/farms' do
    farmer = Farmer.find_by(id: params[:id])
    farms = Farm.find_by(farmer_id: farmer.id)
    farms.match_farms.to_json
  end
  

  
  #creates a list of the planted plants and corresponding data
  get '/farmers/:id/plants' do
    farmer = Farmer.find_by(id: params[:id])
    planted_plants = Farm.find_by(farmer_id: farmer.id)
    planted_plants.match_plants.to_json
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

  # get '/farm_owner/:farmer_id' do 
  #   farmer = Farm.find(params[:farmer_id])
  #   farmer.to_json
  # end

  #allows plants to be added with name, plot_location, and plant_id
  post "/farmers/:id/add_plant" do
    plant_name = Plant.find_by(plant_id: plant_id).name
    farmer = Farmer.find_by(id: params[:farmerId])
    farm = farmer.match_farm

    farmer.afford?(plant_id) ? farm.add_plant(plant_id, plot_location) :
        { error: "you can't afford to buy #{plant_name} yet" }.to_json

      plants = farm.match_plants
      farmer.unlocked_plants << plant_name.uniq
  end

  
# post '/farmers/:id/plants' do
#     new_plant = Plant.find_by(name: params[:plantName])
#     farmer.unlocked_plants.update(..new_plant)
# end



  # #renders the data for the planted plants a farmer has
  # get "/farmers/:id/planted_plants" do
  #   farmer = Farmer.find_by(id: params[:id])
  #   farmer.planted_plants.to_json
  # end
  
  #login database
  post "/login" do
    farmer = Farmer.find_by(username: params[:username])
    if farmer && farmer.authenticate(params[:password])
      return { farmer_id: farmer.id, message: "You Are Successfully Logged In!" }.to_json
    else
      return { farmer_id: 0, error: "Invalid Password" }.to_json
    end
  end

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
          logged_in: true
        )
      return { farmer_id: farmer.id, message: "success" }.to_json
    end
  end


  post "/logout" do
    user = User.find_by(id: params[:id])
    user.update(logged_in: false)
  end

 #signup
  # post "/farmers" do
  #   farmer = Farmer.find_by(username: params[:username])
  #   # starter_plant = Plant.by_price.first 
  #   # starter_upgrades = Plant.all.exclude?(starter_plant)
    
  #   if farmer
  #     return(
  #       {
  #         success: false,
  #         farmer_id: 0,
  #         message: "This Username Is Taken"
  #       }.to_json
  #     )
  #   else
  #     farmer =
  #       Farmer.create(
  #         username: params[:username],
  #         password: params[:password],
  #         coins: 100,
  #         unlocked_plants: "",
  #         locked_plants: "",
  #         logged_in: true
  #       )
  #     return { success: true, farmer_id: farmer.id, message: "Welcome! You Can Now Purchase Plants To Add To Your Farm!" }.to_json
  #   end
  # end

    # get "/planted_plants" do
    #     matches = 
    #       PlantedPlants.all.filter do |plant|
    #         plant["name"].include?(params["name"])
    #       end
    #     matches
    #       .map do |match|
    #         { "planted_plant_id" => match["plant_id"], "plant_name" => match["plant_name"] }
    #       end
    #       .to_json
    #   end





  # returns the same user data as /farmers, but for a single person
  # get "/farmers/:id" do
  #   farmer = Farmer.find(username: params[:username])
  #   farmer.serialize_farmer.to_json
  # end


  # ## returns a list of all of the users with the names of their planted plants
  # get "/farmers" do
  #   Farmer.all.to_json(only: %i[username id], include: :planted_plants)
  # end

  ## find users using a search term
  # get "/farmers/search/:username" do
  #   matches =
  #     User.all.filter { |user| user["username"].include?(params["username"]) }
  #   matches
  #     .map do |match|
  #       { "user_id" => match["id"], "username" => match["username"] }
  #     end
  #     .to_json
  # end


  
    
  # post "/users/friends/send_message" do
  #   user = User.find_by(id: params[:user_id])
  #   recipient = User.find_by(username: params[:recipient])
  #   user.send_pair_message(recipient, params[:message]).to_json
  # end

  # post "/users/channels/send_message" do
  #   user = User.find_by(id: params[:user_id])
  #   recipient = Channel.find_by(channel_name: params[:recipient])
  #   user.send_channel_message(recipient, params[:message]).to_json
  # end

  # get "/channels" do
  #   Channel.all.to_json(include: :channel_messages)
  # end

  # ## creates a new channel
  # post "/channels" do
  #   channel_exists = Channel.find_by(channel_name: params[:channelName])
  #   if (!channel_exists)
  #     new_channel = Channel.create(channel_name: params[:channelName])
  #     created_by = User.find_by(id: params[:userId])
  #     ChannelUser.create(user: created_by, channel: new_channel)
  #     new_channel.to_json
  #   else
  #     { error: "channel already exists" }.to_json
  #   end
  # end

  #   ## join a new channel
  #   post "/channels/join" do
  #     channel_exists = Channel.find_by(channel_name: params[:channelName])
  #     if (channel_exists)
  #       joined_by = User.find_by(id: params[:userId])
  #       ChannelUser.create(user: joined_by, channel: channel_exists)
  #       channel_exists.to_json
  #     else
  #       { error: "channel does not exist" }.to_json
  #     end
  #   end

  #     ## returns all the messages for a particular channel
  # get "/channels/:channelName/messages" do
  #   channel = Channel.find_by(channel_name: params[:channelName])
  #   channel.serialize_channel_messages.to_json
  # end

  # ## returns all the messages for a particular channel
  # post "/channels/:channelName/messages" do
  #   channel = Channel.find_by(channel_name: params[:channelName])
  #   channel.serialize_channel_messages.to_json
  # end

  ## gives a list of available endpoints for this API
  get "/" do
    {
      "base address" => "http://localhost:9292/",
      "possible end points" => %w[
        /login
        /signup
        /farmers
        /plants
        /farms
        /planted_plants
        /farmers/:id
        /plants/:id
        /farms/:id
        /users/:id/planted_plants
      ]
    }.to_json
  end

end
