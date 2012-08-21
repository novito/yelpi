require 'oauth'

module Yelpi
  class Client 
    attr_accessor *Configuration::VALID_CONFIG_KEYS
    attr_reader :consumer, :access_token

    def initialize(options={})
      merged_options = Yelpi.options.merge(options)
      Configuration::VALID_CONFIG_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, merged_options[key])
      end

      # Initialize Consumer and Access Token
      @consumer = OAuth::Consumer.new(@consumer_key,@consumer_secret,{:site => @endpoint})
      @access_token = OAuth::AccessToken.new(@consumer, @token, @token_secret)
    end
  end
end
