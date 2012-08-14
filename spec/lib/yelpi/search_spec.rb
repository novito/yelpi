require_relative '../../spec_helper'
 
describe Yelpi::Search do

  before do
    @client = Yelpi::Client.new 
    @search = Yelpi::Search.new(@client)
    VCR.insert_cassette 'search', :record => :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  it "should accept requests with a term and location" do
    term = 'restaurants'
    location = 'San Francisco'
    @search.general({:term => term, :location => location})
  end

  it "should accept geolocation parameters" do
    sw_latitude = 37.900000
    sw_longitude = -122.500000
    ne_latitude = 37.788022
    ne_longitude = -122.399797
    show = @search.by_bounding_box(sw_latitude,sw_longitude,ne_latitude,ne_longitude,{:term => 'restaurants'})
    puts show["region"]
  end

end

