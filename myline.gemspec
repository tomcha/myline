# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'myline/version'

Gem::Specification.new do |spec|
  spec.name          = "myline"
  spec.version       = Myline::VERSION
  spec.authors       = ["tomcha"]
  spec.email         = ["tomcha@tomcha.net"]

  spec.summary       = %q{This gem is oreore benri ouchi hack tool.}
  spec.description   = %q{This gem is oreore benri ouchi hack tool.}
  spec.homepage      = "http://tomcha.net"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "line-bot-api"
  spec.add_dependency "passenger", '~> 5.0', '>= 5.0.28'
  spec.add_dependency "sinatra", "~> 1.4"
#  spec.add_dependency "mysql2", '~> 0.4.5'
  spec.add_dependency "sqlite3", '~> 1.3', '>= 1.3.12'
  spec.add_dependency "activerecord", '~> 5.0', '>= 5.0.1'

  spec.add_development_dependency "bundler", "~> 2.1.1"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
