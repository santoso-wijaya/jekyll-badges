# frozen_string_literal: true

require_relative "lib/jekyll-badges/version"

Gem::Specification.new do |spec|
  spec.name            = "jekyll-badges"
  spec.version         = Jekyll::Badges::VERSION
  spec.authors         = ["Santoso Wijaya"]
  spec.email           = ["code@swijaya.com"]

  spec.summary         = "A plugin to generate a showcase collection of custom badgespec."
  spec.description     = "A plugin to generate a showcase collection of custom badgespec."
  spec.homepage        = "https://github.com/santoso-wijaya/jekyll-badges"
  spec.license         = "MIT"

  spec.files           = Dir["lib/**/*"]
  spec.require_paths   = ["lib"]

  spec.required_ruby_version = ">= 3.2"

  spec.add_dependency "jekyll", ">= 3.7", "< 5.0"

  spec.add_development_dependency "bundler", "~> 2.4"
  spec.add_development_dependency "rake", "~> 13.0"
end
