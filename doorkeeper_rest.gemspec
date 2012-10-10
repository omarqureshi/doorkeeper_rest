# -*- encoding: utf-8 -*-
require File.expand_path('../lib/doorkeeper_rest/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Omar Qureshi"]
  gem.email         = ["omar@omarqureshi.net"]
  gem.description   = "Adds rest support for doorkeeper"
  gem.summary       = "Adds rest support for doorkeeper"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "doorkeeper_rest"
  gem.require_paths = ["lib"]
  gem.version       = DoorkeeperRest::VERSION
  gem.add_dependency("doorkeeper")
  gem.add_development_dependency("rails", "~> 3.2")
end
