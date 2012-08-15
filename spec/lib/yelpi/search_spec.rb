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

  describe 'bounding box search' do
    before do
      @sw_latitude = 37.900000
      @sw_longitude = -122.500000
      @ne_latitude = 37.788022
      @ne_longitude = -122.399797
    end
    it "should reject the request if sw latitude is not present" do
      expect { @search.by_bounding_box({:sw_longitude => @sw_longitude,:ne_latitude => @ne_latitude, :ne_longitude => @ne_longitude, :term => 'restaurants'}) }.to raise_error(ArgumentError)
    end
    it "should reject the request if sw longitude is not present" do
      expect { @search.by_bounding_box({:sw_latitude => @sw_latitude,:ne_latitude => @ne_latitude, :ne_longitude => @ne_longitude, :term => 'restaurants'}) }.to raise_error(ArgumentError)
    end
    it "should reject the request if ne longitude is not present" do
      expect { @search.by_bounding_box({:sw_latitude => @sw_latitude,:ne_latitude => @ne_latitude, :sw_longitude => @sw_longitude, :term => 'restaurants'}) }.to raise_error(ArgumentError)
    end
    it "should reject the request if ne latitude is not present" do
      expect { @search.by_bounding_box({:sw_latitude => @sw_latitude,:ne_longitude => @ne_longitude, :sw_longitude => @sw_longitude, :term => 'restaurants'}) }.to raise_error(ArgumentError)
    end
    it "should return businesses if all geo bounds are provided" do
      results =  @search.by_bounding_box({:sw_latitude => @sw_latitude, :ne_latitude => @ne_latitude, :ne_longitude => @ne_longitude, :sw_longitude => @sw_longitude, :term => 'restaurants'}) 
      results.should have_key("businesses")
      results["businesses"].should_not be_empty
    end
  end

  describe 'geographic coordinate search' do
    it "should reject the request if latitude is not present" do
      pending
    end
  end

end

