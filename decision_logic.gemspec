# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'decision_logic/version'

Gem::Specification.new do |spec|
  spec.name          = "decision_logic"
  spec.version       = DecisionLogic::VERSION
  spec.authors       = ["Andre Mouton"]
  spec.email         = ["andre@amtek.co.za", "info@shuntyard.co.za", "info@easylodge.com.au"]
  spec.summary       = %q{Ruby gem to make requests to Decision Logic service.}
  spec.description   = %q{Ruby gem to make requests to Decision Logic service. Website: https://www.decisionlogic.com}
  spec.homepage      = "https://github.com/easylodge/decision_logic"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_dependency 'savon', "~> 2.5.1"
end
