require 'patron'
require 'json'
require_relative 'watsi_profile'

module CharitableSniper

  class WatsiApiClient

    def initialize
      @session = Patron::Session.new
      @session.timeout = 20
      @session.connect_timeout = 10
      @session.base_url = "https://watsi.org"
    end

    def profiles
      watsi_json["profiles"].map{|profile_json| WatsiProfile.create(profile_json)}
    end

    private

    def watsi_json
      response = @session.get("/fund-treatments.json")
      if response.status < 400
        JSON.parse(response.body)
      else
        {}
      end
    rescue
      {}
    end

  end

end