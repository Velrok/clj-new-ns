# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clj/new/ns/version'

Gem::Specification.new do |spec|
  spec.name          = "clj-new-ns"
  spec.version       = Clj::New::Ns::VERSION
  spec.authors       = ["Waldemar"]
  spec.email         = ["waldemar.schwan@gmail.com"]
  spec.description   = %q{Given a namespace it creates Clojure files and specs following the naming convention.}
  spec.summary       = %q{Creates correctly names clj files.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency "docopt"
end
