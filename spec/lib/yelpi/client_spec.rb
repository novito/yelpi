require_relative '../../spec_helper'
# For Ruby < 1.9.3, use this instead of require_relative
# require (File.expand_path('./../../../spec_helper', __FILE__))
 
describe Yelpi::Client do
 
  it "must work" do
    "Yay!".should be_kind_of(String)
  end
 
end

