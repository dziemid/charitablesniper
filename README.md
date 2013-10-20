# Charitable Sniper

Checks if there are any profiles on https://watsi.org/ that could be fully funded for less than 10$.
If so, sends a tweet about with link to those profiles.

Sample twitter account: https://twitter.com/charitables10

## Configuration

You will need Twitter account and application associated with it. Set the following environment variables:

        export TWITTER_CONSUMER_KEY={yourvalue}
        export TWITTER_CONSUMER_SECRET={yourvalue}
        export TWITTER_OAUTH_TOKEN={yourvalue}
        export TWITTER_OAUTH_TOKEN_SECRET={yourvalue}

## Running the app

        bundle install
        bundle exec rackup

        Navigate to http://localhost:9292/triger