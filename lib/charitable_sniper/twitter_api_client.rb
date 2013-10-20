module CharitableSniper

  class TwitterApiClient

    def action_for profile
      message = "Donate $#{profile.target_to_go} to fund treatment for #{profile.name} ( #{profile.url} )"
      puts message
      Twitter.update(message)
    end

  end

end
