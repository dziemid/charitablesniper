require './lib/charitable_sniper/watsi_api_client'

module CharitableSniper

  describe WatsiApiClient do

    it "returns profiles" do
      expect(subject.profiles).to_not be_empty
    end

    it "profiles are populated with interesting fields" do
      profile = subject.profiles.first
      expect(profile.name.empty?).to be(false)
      expect(profile.url.empty?).to be(false)
      expect(profile.description.empty?).to be(false)
    end
  end

end