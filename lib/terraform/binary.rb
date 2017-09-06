require 'os'

require 'terraform/binary/version'
require 'terraform/binary/helpers'
require 'terraform/binary/compressor'
require 'terraform/binary/executable'
require 'terraform/binary/command'

# This module handles downloading and extracting of the associated binary as well
# as providing a dynamic namespace and ruby client for sub-commands of said binary
module Terraform
  # The Binary namespace handles sub-commands using {#method_missing} metaprogramming
  # as well as the global configuration object
  module Binary

    # @!attribute config
    #   @return [Configuration] the global configuration object
    attr_writer :config

    module_function

    # defines the @config class variable
    def config
      @config ||= Configuration.new
    end

    # Set the global settings. See the {file:README.md README} for more information
    def configure
      yield(config)
    end

    # This method maps Terraform::Binary method calls to Terraform sub-commands
    # Ex. to run `terraform plan -machine-readable test/dir`:
    #
    # ```ruby
    # Terraform::Binary.plan('-machine-readable test/dir')
    # ```
    #
    # @note if the method is an invalid sub-command or if the command fails
    #   you will get a {Command::CommandFailure} exception
    # @since 0.2.0
    def method_missing(method, *args, &block)
      if method.to_s =~ /(\w+)/
        Terraform::Binary::Helpers.debug("#{method.to_s.downcase} #{args.join(' ')}")
        Command.run("#{method.to_s.downcase} #{args.join(' ')}")
      else
        super
      end
    end

    def respond_to_missing?(method, *)
      method =~ /(\w+)/ || super
    end

    # This class holds the global configuration items
    class Configuration
      attr_accessor :version
      attr_accessor :download_path

      def initialize
        @version = TERRAFORM_VERSION
        @download_path = '/tmp'
      end
    end
  end
end
