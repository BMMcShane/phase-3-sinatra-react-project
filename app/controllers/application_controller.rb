class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'


  get '/farmers' do 
    farmers = Farmer.all
    farmers.to_json
  end

  get '/plants' do 
    plants = Plant.all
    plants.to_json
  end

  get '/plants/:id' do 
    plants = Plant.find(params[:id])
    plants.to_json
  end

  get '/farmers/:id' do
    farmer = Farmer.find(params[:id])
    farmer.to_json(inclue: :plants)
  end

  post '/farmers' do
    farmers = Farmer.create(

      username: params[:username], 
      password: params[:password]
      )
    farmers.to_json
  end

end
