require './lib/charitable_sniper/watsi_profile'

module CharitableSniper

  describe WatsiProfile do

    let(:target) { "$1,500" }

    let(:target_to_go) { "$1,295 To Go" }

    let(:json) do
      {
          "id" => 896,
          "token" => "490de0b04343",
          "name" => "Marie",
          "age" => 25,
          "country" => "Haiti",
          "promo_description" => "Marie needs radiation therapy to treat a cancerous tumor and give her her life back.",
          "url" => "https://watsi.org/profile/490de0b04343-marie",
          "badge_url" => "https://d3w52z135jkm97.cloudfront.net/uploads/profile/image/896/badge_marie_site_photo.jpg",
          "profile_url" => "https://d3w52z135jkm97.cloudfront.net/uploads/profile/image/896/profile_marie_site_photo.jpg",
          "per_cent_funded" => "13%",
          "target" => target,
          "target_to_go" => target_to_go,
          "donated" => "$205",
          "number_of_donors" => 6
      }
    end

    let(:profile) { WatsiProfile.create(json) }

    it "parses profile json" do
      expect(profile.name).to eq("Marie")
      expect(profile.url).to eq("https://watsi.org/profile/490de0b04343-marie")
      expect(profile.description).to eq("Marie needs radiation therapy to treat a cancerous tumor and give her her life back.")
      expect(profile.target).to eq(1500)
      expect(profile.target_to_go).to eq(1295)
    end

    context "ten dolars left" do

      context "less then 10" do
        let(:target) { "$1,500" }
        let(:target_to_go) { "$2 To Go" }

        it "is ready to go" do
          expect(profile.ready?).to eq(true)
        end

      end

      context "exactly 10" do
        let(:target) { "$1,500" }
        let(:target_to_go) { "$10 To Go" }

        it "is ready to go" do
          expect(profile.ready?).to eq(true)
        end

      end

      context "more then 10" do
        let(:target) { "$1,500" }
        let(:target_to_go) { "$11 To Go" }

        it "is not ready to go" do
          expect(profile.ready?).to eq(false)
        end

      end

    end

  end

end