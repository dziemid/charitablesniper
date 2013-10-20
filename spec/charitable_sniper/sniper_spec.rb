require './lib/charitable_sniper/sniper'
require './lib/charitable_sniper/watsi_profile'

module CharitableSniper

  describe Sniper do

    it "notifes output about profiles that are ready" do
      ready_profile = WatsiProfile.new(1,"ready", "desc", "url", 1000, 1)
      not_ready_profile = WatsiProfile.new(1,"not ready", "desc", "url", 1000, 11)
      watsi_api = double("watsi_api", :profiles => [ready_profile, not_ready_profile])
      output = double("output", :action_for => nil)
      sniper = Sniper.new(watsi_api, output)

      sniper.action!

      expect(output).to have_received(:action_for).with(ready_profile)
      expect(output).to_not have_received(:action_for).with(not_ready_profile)

    end

  end

end