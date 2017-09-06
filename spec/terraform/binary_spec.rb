require 'spec_helper'

module Terraform
  describe Binary do
    it 'has a version number' do
      expect(Terraform::Binary::VERSION).not_to be nil
    end

    # Define Public interface
    it { should respond_to(:apply) }
    it { should respond_to(:console) }
    it { should respond_to(:destroy) }
    it { should respond_to(:env) }
    it { should respond_to(:fmt) }
    it { should respond_to(:get) }
    it { should respond_to(:graph) }
    it { should respond_to(:import) }
    it { should respond_to(:init) }
    it { should respond_to(:output) }
    it { should respond_to(:plan) }
    it { should respond_to(:providers) }
    it { should respond_to(:push) }
    it { should respond_to(:refresh) }
    it { should respond_to(:show) }
    it { should respond_to(:taint) }
    it { should respond_to(:untaint) }
    it { should respond_to(:validate) }
    it { should respond_to(:version) }
    it { should respond_to(:workspace) }

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
