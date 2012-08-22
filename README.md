# Yelp API (v2.0) Ruby Gem
A Ruby wrapper for the Yelp API (v2.0 ~ OAuth). 

## Functionalities


## Installation
    gem install yelpi

## How to Use

  1. Add your API keys

    Yelpi.configure do |config|
      config.consumer_key = YOUR_CONSUMER_KEY
      config.consumer_secret = YOUR_CONSUMER_SECRET
      config.oauth_token = YOUR_OAUTH_TOKEN
      config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
    end


