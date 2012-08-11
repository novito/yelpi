require_relative '../../spec_helper'
# For Ruby < 1.9.3, use this instead of require_relative
# require (File.expand_path('./../../../spec_helper', __FILE__))
 
describe Yelpi::Configuration do
 
  it "must return a consumer key" do
    Yelpi.consumer_key.should eql Yelpi::Configuration::CONSUMER_KEY
  end

  it "must return a consumer secret" do
    Yelpi.consumer_secret.should eql Yelpi::Configuration::CONSUMER_SECRET
  end

  it "must return a token" do
    Yelpi.token.should eql Yelpi::Configuration::TOKEN
  end

  it "must return a token secret" do
    Yelpi.token.should eql Yelpi::Configuration::TOKEN_SECRET
  end

end

