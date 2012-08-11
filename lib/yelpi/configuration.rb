module Yelpi
  module Configuration
    ENDPOINT = 'https://api.yelp.com' 
    CONSUMER_KEY = 'zeUN39MhQwBCAON4gsji-g'
    CONSUMER_SECRET = 'kpOWMWFmxt0xVdE2Qfhsc---q8M'
    TOKEN = '7RIJttUGVq6-OD3mvqXbFWjSAOICXPwX'
    TOKEN_SECRET = '1r82_xlhvOUZ0J2784A0ojWvs-A'

    attr_accessor :endpoint, :consumer_key, :consumer_secret, :token, :token_secret

    def self.extended(base)
      base.reset
    end

    def reset
      self.endpoint = ENDPOINT
      self.consumer_key = CONSUMER_KEY
      self.consumer_secret = CONSUMER_SECRET 
      self.token = TOKEN 
      self.token_secret = TOKEN_SECRET
    end

  end
end
