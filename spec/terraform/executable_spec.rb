module Terraform
  module Binary
    describe Executable do
      context 'Terraform v0.10.3' do
        before do
          Terraform::Binary.configure do |config|
            config.version = '0.10.3'
            config.download_path = '/tmp'
          end
        end

        it 'downloads & extracts binary' do
          b = Executable.new
          b.download
          b.extract
          expect(b.binary.nil?).to be false
        end
      end
    end
  end
end
