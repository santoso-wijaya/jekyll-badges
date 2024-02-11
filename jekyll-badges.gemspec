# frozen_string_literal: true

require_relative "lib/jekyll-badges/version"

Gem::Specification.new do |s|
  s.name            = "jekyll-badges"
  s.version         = Jekyll::Badges::VERSION
  s.authors         = ["Santoso Wijaya"]
  s.email           = ["code@swijaya.com"]
  s.summary         = "A plugin to generate a showcase collection of custom badges."
  s.homepage        = "https://github.com/santoso-wijaya/jekyll-badges"
  s.license         = "MIT"

  s.files           = Dir["lib/**/*"]
  s.require_paths   = ["lib"]

  s.required_ruby_version = ">= 3.2"

  s.add_dependency "jekyll", ">= 3.7", "< 5.0"
  s.add_dependency "rbs", "~> 3.2"

  s.add_development_dependency "bundler", "~> 2.4"
  s.add_development_dependency "rake", "~> 13.0"
end
