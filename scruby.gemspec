lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "scruby/version"

Gem::Specification.new do |spec|
  spec.name          = "scruby"
  spec.version       = Scruby::VERSION
  spec.authors       = ["Macario Ortega", "Damián Silvani"]
  spec.email         = ["macarui@gmail.com", "munshkr@gmail.com"]

  spec.summary       = %q{SuperCollider client for Ruby}
  spec.description   = %q{SuperCollider client for Ruby}
  spec.homepage      = "http://github.com/munshkr/scruby"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3.2"
  spec.add_development_dependency "rspec", "~> 3.8.0"
  spec.add_development_dependency "pry", "~> 0.12.2"

  spec.add_dependency "ruby-osc", "~> 0.3"
  spec.add_dependency "arguments", "~> 0.6"
  spec.add_dependency "live", "~> 0.1"
end
