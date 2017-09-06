require 'spec_helper'

module Terraform
  describe Binary do
    it 'has a version number' do
      expect(Terraform::Binary::VERSION).not_to be nil
    end

    # Define Public interface
    it { should respond_to(:build) }
    it { should respond_to(:fix) }
    it { should respond_to(:inspect) }
    it { should respond_to(:push) }
    it { should respond_to(:validate) }
    it { should respond_to(:version) }

    before do
      Terraform::Binary.configure do |config|
        config.version = '0.10.3'
        config.download_path = '/tmp/tests'
      end
    end

    it 'configures options' do
      expect(Terraform::Binary.config.download_path).equal? '/tmp/tests'
    end

    it 'maps dymanic methods to binary sub-commands' do
      expect(Terraform::Binary.version).to eq true
    end

    it 'throws CommandFailure on invalid sub-command' do
      expect { Terraform::Binary.versions } .to raise_error Terraform::Binary::Command::CommandFailure
    end
  end
end
