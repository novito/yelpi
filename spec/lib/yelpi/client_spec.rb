require_relative '../../spec_helper'
# For Ruby < 1.9.3, use this instead of require_relative
# require (File.expand_path('./../../../spec_helper', __FILE__))
 
describe Yelpi::Client do
 
  describe 'set instance variable from configuration' do
    before(:each) do
      @client = Yelpi::Client.new
    end
    it "must have an accessible endpoint variable" do
      @client.endpoint.should eq Yelpi::Configuration::ENDPOINT
    end
    it "must have an accessible consumer key" do
      @client.consumer_key.should eq Yelpi::Configuration::CONSUMER_KEY
    end
    it "must have an accessible consumer secret" do
      @client.consumer_secret.should eq Yelpi::Configuration::CONSUMER_SECRET
    end
    it "must have an accessible token" do
      @client.token.should eq Yelpi::Configuration::TOKEN
    end
    it "must have an accessible token" do
      @client.token_secret.should eq Yelpi::Configuration::TOKEN_SECRET
    end
  end

  describe "set oauth-consumer" do
    it "must have a valid oauth-consumer when credentials exist" do
      @client = Yelpi::Client.new
      @client.consumer.should_not be_nil
    end
  end
  
  describe "set oauth-access-token" do
    it "must have a valid acces token when credentials exist" do
      @client = Yelpi::Client.new
      @client.access_token.should_not be_nil
    end
  end
 
end

