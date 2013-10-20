require_relative "spec_helper"
require_relative "../charitablesniper.rb"

def app
  Charitablesniper
end

describe Charitablesniper do

  include Rack::Test::Methods

  it "responds with a welcome message" do
    post '/triger'
    expect(last_response.body).to include("works")
  end
end
