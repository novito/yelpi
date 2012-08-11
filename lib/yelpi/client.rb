module Yelpi
  class Client 
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize()
      Yelpi::Configuration::VALID_CONFIG_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, key)
      end
    end
  end
end
