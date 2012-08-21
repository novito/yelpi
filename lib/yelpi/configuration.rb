module Yelpi
  module Configuration
    ENDPOINT = 'http://api.yelp.com' 
    CONSUMER_KEY = nil 
    CONSUMER_SECRET = nil 
    TOKEN = nil 
    TOKEN_SECRET = nil 
    
    VALID_CONFIG_KEYS = [:endpoint, :consumer_key, :consumer_secret, :token, :token_secret]

    attr_accessor *VALID_CONFIG_KEYS 

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

    def configure
      yield self
    end

    # Return the configuration values set in this module
    def options
      Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end

  end
end
