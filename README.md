[![Gem Version](https://badge.fury.io/rb/terraform-binary.svg)](https://badge.fury.io/rb/terraform-binary)
![Build](https://github.com/nathantcz/terraform-binary/actions/workflows/publish.yml/badge.svg?branch=master)
[![Coverage Status](https://coveralls.io/repos/github/NathanTCz/terraform-binary/badge.svg?branch=master)](https://coveralls.io/github/NathanTCz/terraform-binary?branch=master)
[![Documentation](https://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/terraform-binary)
# Terraform::Binary

A gem to install and interface with HashiCorp's Terraform utility

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'terraform-binary'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install terraform-binary

## Usage

You need to specify which version of [HashiCorp Terraform](https://www.terraform.io/downloads.html) to use. You can also specify where to save the binary file.

```ruby
require 'terraform/binary'

Terraform::Binary.configure do |config|
  config.version = '1.0.4'
  config.download_path = '/tmp'
end
```

### Dynamic Methods

The {Terraform::Binary} module will automagically map method calls to `terraform` commands. This serves to better support future versions of `terraform` and potentially new commands. For example, the equivalent of `terraform plan test/dir` in Ruby:

```ruby
Terraform::Binary.plan('test/dir')
```

If you call a method not supported by the `terraform` binary, you will get a {Terraform::Binary::Command::CommandFailure} exception.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/terraform-binary.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
