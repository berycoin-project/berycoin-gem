
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "berycoin/gem/version"

Gem::Specification.new do |spec|
  spec.name          = "berycoin-gem"
  spec.version       = Berycoin::Gem::VERSION
  spec.authors       = ["Bilal Haider"]
  spec.email         = ["bilal_haider032@gmail.com"]

  spec.summary       = %q{Berycoin-gem is a ruby gem to interact with berycoin node}
  spec.description   = %q{Berycoin-gem helps you talk to berycoin node, you have access to all methods which bitcoin 0.13.3 has in it,
                       infact this gem can be used with bitcoin/litecoin and forks of them.  }
  spec.homepage      = "http://www.github.com/berycoin-project/berycoin-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
