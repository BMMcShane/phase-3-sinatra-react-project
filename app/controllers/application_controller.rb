class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'


  #returns a list of all of the users with the names of their planted plants
  get '/farmers' do 
    farmers = Farmer.all
    farmers.to_json
  end

  #returns the same information as /farmer for an individual farmer
  get '/farmers/:id' do
    farmer = Farmer.find(params[:id])
    farmer.to_json
  end


  #creates a list of all the plants in the Mill
  get '/plants' do 
    plants = Plant.all
    plants.to_json
  end

  #creates a string of the data for an individual plant
  get '/plants/:id' do 
    plants = Plant.find(params[:id])
    plants.to_json
  end

  #login database
  post "/login" do
    farmer = Farmer.find_by(username: params[:username])
    if farmer && farmer.authenticate(params[:password])
      return { success: true, farmer_id: farmer.id, message: "You Are Successfully Logged In!" }.to_json
    else
      return { success: false, farmer_id: 0, message: "Please Try Again" }.to_json
    end
  end

  #renders the data for the planted plants a farmer has
  get "/farmers/:id/planted_plants" do
    farmer = Farmer.find_by(id: params[:id])
    farmer.pair_planted_plants.to_json
  end

  
  # post "/logout" do
  #   user = User.find_by(id: params[:id])
  #   user.update(logged_in: false)
  # end

 #signup
  post "/signup" do
    user = Farmer.find_by(username: params[:username])
    # starter_plant = Plant.by_price.first 
    # starter_upgrades = Plant.all.exclude?(starter_plant)
    
    if user
      return(
        {
          success: false,
          farmer_id: 0,
          message: "This Username Is Taken"
        }.to_json
      )
    else
      farmer =
        Farmer.create(
          username: params[:username],
          password: params[:password],
          coins: 100,
          unlocked_plants: "",
          locked_plants: "",
          logged_in: true
        )
      return { success: true, farmer_id: farmer.id, message: "Welcome! You Can Now Purchase Plants To Add To Your Farm!" }.to_json
    end
  end



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

    ## returns the same user data as /farmers, but for a single person
    # get "/farmers/:id" do
    #   farmer = Farmer.find(id: params[:id])
    #   farmer.serialize_farmer.to_json
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
        /farmers/:id
        /users/:id/planted_plants
      ]
    }.to_json
  end

end
