module Yelpi
  class Client 
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options={})
      merged_options = Yelpi.options.merge(options)
      Configuration::VALID_CONFIG_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, merged_options[key])
      end
    end
  end
end
