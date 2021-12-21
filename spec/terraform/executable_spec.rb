module Terraform
  module Binary
    describe Executable do
      context 'Terraform v1.1.2' do
        before do
          Terraform::Binary.configure do |config|
            config.version = '1.1.2'
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
