module CharitableSniper

  class Sniper

    def initialize(watsi_api, output)
      @watsi_api = watsi_api
      @output = output
    end

    def action!
      @watsi_api.profiles.each do |p|
        @output.action_for(p) if p.ready?
      end
    end

  end

end