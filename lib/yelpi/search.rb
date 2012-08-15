module Yelpi
  class Search

    BASE_URL = "/v2/search"

    def initialize(client)
      @client = client
    end

    def fetch(options = {})
      url_params = parametrize(options)
      results = @client.access_token.get(BASE_URL + "?" + url_params).body
      return JSON.parse(results)
    end

    def by_bounding_box(options = {} )
      if options.has_key?(:sw_latitude) && options.has_key?(:sw_longitude) && options.has_key?(:ne_latitude) && options.has_key?(:ne_longitude) 
	box_params = "#{options.delete(:sw_latitude).to_s},#{options.delete(:sw_longitude).to_s}|#{options.delete(:ne_latitude).to_s},#{options.delete(:ne_longitude).to_s}"
	options.merge!({:bounds => box_params})  
	url_params = parametrize(options)
	results = @client.access_token.get(BASE_URL + "?" + url_params).body
	return JSON.parse(results)
      else
	raise ArgumentError "The following arguments are mandatory: :sw_latitude, :sw_longitude, :ne_latitude, :ne_longitude"
      end
    end

    def by_geo_coordinate(options = {})
      if options.has_key?(:latitude) && options.has_key?(:longitude)
	geo_params = "#{options.delete(:latitude).to_s},#{options.delete(:longitude).to_s}"
	# Check for optional geo related params.
	if options.has_key?(:accuracy)
	  geo_params += ",#{options.delete(:accuracy).to_s}" 
	  if options.has_key?(:altitude)
	    geo_params += ",#{options.delete(:altitude).to_s}" 
	    if options.has_key?(:altitude_accuracy)
	      geo_params += ",#{options.delete(:altitude_accuracy).to_s}" 
	    end
	  end
	end
      options.merge!({:ll => geo_params})  
      url_params = parametrize(options)
      results = @client.access_token.get(BASE_URL + "?" + url_params).body
      return JSON.parse(results)
      else
	raise ArgumentError "The following arguments are mandatory: :latitude, :longitude"
      end
    end

    def by_location(options = {})
      if options.has_key?(:location)
	if options.has_key?(:latitude) && options.has_key?(:longitude)
	  geo_params = "#{options.delete(:latitude).to_s},#{options.delete(:longitude).to_s}" 
	  options.merge!({:cll => geo_params})
	  url_params = parametrize(options)
	  results = @client.access_token.get(BASE_URL + "?" + url_params).body
	  return JSON.parse(results)
	end
      else
	raise ArgumentError "The following arguments is mandatory: :location"
      end
    end

    private

    # Given a hash of parameters returns a URI string
    def parametrize(params)
      URI.escape(params.collect{|k,v| "#{k}=#{v}"}.join('&'))
    end

  end
end
