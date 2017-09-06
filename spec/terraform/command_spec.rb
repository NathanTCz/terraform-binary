module Terraform
  module Binary
    describe Command do
      context 'Terraform v0.10.3' do
        before do
          Terraform::Binary.configure do |config|
            config.version = '0.10.3'
          end
        end

        it 'runs command with binary' do
          expect(Terraform::Binary::Command.run('--help > /dev/null')).to eq true
        end
      end
    end
  end
end
