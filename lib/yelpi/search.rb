module Yelpi
  class Search

    @base_url = "/v2/search"
    class << self
      attr_accessor :base_url 
    end

    attr_accessor :client

    def initialize(client)
      @client = client
    end

    def general(options = {})
      url_params = parametrize(options)
      results = @client.access_token.get(Yelpi::Search.base_url + "?" + url_params).body
      return JSON.parse(results)
    end

    def by_bounding_box(sw_latitude,sw_longitude,ne_latitude,ne_longitude,options = {})
      box_params = sw_latitude.to_s + "," + sw_longitude.to_s + "|" + ne_latitude.to_s + "," + ne_longitude.to_s
      options.merge!({:bounds => box_params})  
      url_params = parametrize(options)
      results = @client.access_token.get(Yelpi::Search.base_url + "?" + url_params).body
      return JSON.parse(results)
    end

    private

    # Given a hash of parameters returns a URI string
    def parametrize(params)
      URI.escape(params.collect{|k,v| "#{k}=#{v}"}.join('&'))
    end

  end
end
