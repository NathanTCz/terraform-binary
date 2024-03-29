# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "terraform/binary/version"

Gem::Specification.new do |spec|
  spec.name          = "terraform-binary"
  spec.version       = Terraform::Binary::VERSION
  spec.authors       = ["Nathan Cazell"]
  spec.email         = ["nathan.cazell@imageapi.com"]

  spec.summary       = "A gem to install and interface with HashiCorp's Terraform utility"
  spec.homepage      = 'https://github.com/nathantcz/terraform-binary'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.49'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'coveralls'

  spec.add_runtime_dependency 'rubyzip'
  spec.add_runtime_dependency 'os'
end
