class Charitablesniper < Sinatra::Base

  set :public_folder => "public", :static => true

  get "/" do
    erb :welcome
  end

  get "/triger" do
    "works"
  end

end
