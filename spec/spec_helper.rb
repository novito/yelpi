#we need the actual library file
require_relative '../lib/yelpi'
# For Ruby < 1.9.3, use this instead of require_relative
# require(File.expand_path('../../lib/dish', __FILE__))
 
#dependencies
require 'webmock/rspec'
require 'rspec'
require 'vcr'
 
#VCR config
VCR.config do |c|
  c.cassette_library_dir = 'spec/fixtures/yelpi_cassettes'
  c.stub_with :webmock
end
