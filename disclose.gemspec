# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'disclose/version'

Gem::Specification.new do |spec|
  spec.name          = Disclose::PROJECT_NAME
  spec.version       = Disclose::VERSION
  spec.authors       = ['dkhamsing']
  spec.email         = ['dkhamsing8@gmail.com']

  spec.summary       = Disclose::PROJECT_DESCRIPTION
  spec.description   = Disclose::PROJECT_DESCRIPTION
  spec.homepage      = Disclose::PROJECT_URL

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'octokit' # github
  spec.add_runtime_dependency 'netrc'   # credentials
end
