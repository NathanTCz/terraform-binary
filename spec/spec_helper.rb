require 'bundler/setup'

# Coverage needs to be included before the rest of the source
require 'coveralls'
Coveralls.wear!

require 'terraform/binary'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
