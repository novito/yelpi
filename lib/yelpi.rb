require "httparty"
Dir[File.dirname(__FILE__) + '/yelpi/*.rb'].each do |file|
  require file
end

module Yelpi
  extend Configuration
end
