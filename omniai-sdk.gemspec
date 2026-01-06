Gem::Specification.new do |spec|
  spec.name          = "omniai-sdk"
  spec.version       = "1.0.0"
  spec.authors       = ["OmniAI Team"]
  spec.email         = ["dev@omniaiassist.com"]

  spec.summary       = "Official Ruby SDK for OmniAI API"
  spec.description   = "Multi-channel messaging platform with AI automation - Official Ruby client"
  spec.homepage      = "https://github.com/omniaiassist/omniai-ruby-sdk"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/omniaiassist/omniai-ruby-sdk"
  spec.metadata["changelog_uri"] = "https://github.com/omniaiassist/omniai-ruby-sdk/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 2.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"

  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.0"
end
