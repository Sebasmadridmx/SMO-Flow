# frozen_string_literal: true

require_relative "lib/smo_flow/version"

Gem::Specification.new do |spec|
  spec.name          = "smo_flow"
  spec.version       = SmoFlow::VERSION
  spec.authors       = ["Sebastian Madrid Ontiveros"]
  spec.email         = ["sebasmadrid20@hotmail.com"]

  spec.summary       = "Subcatchment output flow calculator using component-based drainage calculations"
  spec.description   = "A Ruby library for estimating flow from roads, roofs, " \
                       "permeable areas, foul flow, and trade flow using the " \
                       "Rational Method and timestep-based calculations."
  spec.homepage      = "https://github.com/Sebasmadridmx/SMO-Flow"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Sebasmadridmx/SMO-Flow"
  spec.metadata["changelog_uri"]   = "https://github.com/Sebasmadridmx/SMO-Flow/blob/main/CHANGELOG.md"

  spec.files         = Dir["lib/**/*", "LICENSE.txt", "README.md", "CHANGELOG.md"]
  spec.require_paths = ["lib"]
end
