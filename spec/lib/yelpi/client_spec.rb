require_relative '../../spec_helper'
# For Ruby < 1.9.3, use this instead of require_relative
# require (File.expand_path('./../../../spec_helper', __FILE__))
 
describe Yelpi::Client do
 
  describe 'set instance variable from configuration' do
    before(:each) do
      @client = Yelpi::Client.new
    end
    it "must have an accessible endpoint variable" do
      puts @client.inspect
      @client.endpoint.should eq Yelpi::Configuration::ENDPOINT
    end
  end
 
end

