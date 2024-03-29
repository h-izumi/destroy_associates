# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'destroy_associates/version'

Gem::Specification.new do |spec|
  spec.name          = "destroy_associates"
  spec.version       = DestroyAssociates::VERSION
  spec.authors       = ["h-izumi"]
  spec.email         = ["h-izumi@9uelle.jp"]
  spec.summary       = %q{Destroy associations if specified attribute is blank}
  spec.description   = %q{Destroy associations if specified attribute is blank}
  spec.homepage      = "https://github.com/h-izumi/destroy_associates"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">=3.2"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "10.2.2"
  spec.add_development_dependency "rspec", "2.14.1"
  spec.add_development_dependency "sqlite3", "1.3.9"

  spec.add_development_dependency "concurrent-ruby", "0.5.0"
  spec.add_development_dependency "minitest", "5.3.2"
end
