require './lib/charitable_sniper'

class Charitablesniper < Sinatra::Base

  set :public_folder => "public", :static => true

  get "/" do
    erb :welcome
  end

  get "/triger" do
    watsi_api_client = CharitableSniper::WatsiApiClient.new
    twitter_api_client = CharitableSniper::TwitterApiClient.new
    sniper = CharitableSniper::Sniper.new(watsi_api_client, twitter_api_client)
    sniper.action!
    "works"
  end

end
