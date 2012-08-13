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

end

