module CharitableSniper

  class WatsiProfile

    attr_reader :name, :url, :description, :target, :target_to_go

    def self.create(data)
      WatsiProfile.new(data["id"],
                       data["name"],
                       data["promo_description"],
                       data["url"],
                       to_number(data["target"]),
                       to_number(data["target_to_go"])
      )
    end

    def initialize(id, name, description, url, target, target_to_go)
      @id = id
      @name = name
      @description = description
      @url = url
      @target = target
      @target_to_go = target_to_go
    end

    def ready?
      @target_to_go <= 200
    end

    def to_s
      "#{@name}, #{@target_to_go}"
    end

    private

    def self.to_number value
      value.gsub(/,|\$/,'').to_i
    end

  end

end