# Yelp API (v2.0) Ruby Gem
A Ruby wrapper for the Yelp API (v2.0 ~ OAuth). 

## Functionalities


## Installation
    gem install yelpi

## How to Use

### Add your API keys 

    Yelpi.configure do |config|
      config.consumer_key = 'your consumer key'
      config.consumer_secret  = 'your consumer secret' 
      config.token  = 'your token' 
      config.token_secret  = 'your token secret' 
    end

### Create a Client

    client = Yelpi::Client.new

You can also overwrite the keys in the configuration for a particular client:

    client = Yelpi::Client.new(:consumer_key => 'your new consumer key',:consumer_secret => 'your new consumer secret',:token => 'your new token',:token_secret => 'your new token secret')

### Create a Search Requester

    search = Yelpi::Search.new(client)

### Perform the call to the API

    sw_latitude = 37.900000
    sw_longitude = -122.500000
    ne_latitude = 37.788022
    ne_longitude = -122.399797

    results = new_search.by_bounding_box(:sw_latitude => sw_latitude, :sw_longitude => sw_longitude, :ne_latitude => ne_latitude, :ne_longitude => ne_longitude)

