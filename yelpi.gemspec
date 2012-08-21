# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "yelpi/version"

Gem::Specification.new do |s|
  s.name        = "yelpi"
  s.version     = Yelpi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Joan Roig Arderiu"]
  s.email       = ["roigarderiu@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Yelp v2.0 API}
  s.description = %q{Wrapper to interact with the Yelp's v2.0 API (via OAuth).}
  
  s.add_development_dependency "rspec"

  s.rubyforge_project = "yelpi"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
