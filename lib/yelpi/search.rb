module Yelpi
  class Search
    attr_accessor :client

    def initialize(client)
      @client = client
    end

    def general(options = {})
      term = 'restaurants'
      results = @client.access_token.get("/v2/search")
    end

  end
end
