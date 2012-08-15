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

  it "should be able to retrieve business by a term" do
    term = 'restaurants'
    location = 'San Francisco'
    results = @search.fetch({:term => term, :location => location})
  end

  it "should accept geolocation parameters" do
    sw_latitude = 37.900000
    sw_longitude = -122.500000
    ne_latitude = 37.788022
    ne_longitude = -122.399797
    @search.by_bounding_box({:sw_latitude => sw_latitude,:sw_longitude => sw_longitude,:ne_latitude => ne_latitude, :ne_longitude => ne_longitude, :term => 'restaurants'})
  end

  it "should accept location by geographic coordinate" do
    latitude = 37.788022
    longitude = -122.399797 
    results = @search.by_geo_coordinate({:latitude => latitude, :longitude => longitude})
    results.should_not be_nil
  end

  it "should accept location by geographic coordinate" do
    latitude = 37.788022
    longitude = -122.399797 
    results = @search.by_geo_coordinate({:latitude => latitude, :longitude => longitude})
    results.should_not be_nil
  end

  it "should accept location by location string and latitude/longitude" do
    location = 'Castro, San Francisco'
    latitude = 37.7627
    longitude = 122.4352
    results =  @search.by_location({:location => location, :latitude => latitude, :longitude => longitude})
    results.should_not be_nil
  end

end

