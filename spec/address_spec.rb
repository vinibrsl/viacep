RSpec.describe ViaCep::Address do
  describe '#initialize' do
    context 'when a valid CEP is passed' do
      subject(:address) { ViaCep::Address.new('80210130') }

      it 'returns the Address' do
        expect(address.address).not_to be_empty
      end
    end

    context 'when a invalid length CEP is passed' do
      it 'raises ArgumentError' do
        expect { ViaCep::Address.new('000000') }.
          to raise_error(ArgumentError)
      end
    end

    context 'when a unexistent CEP is passed' do
      it 'raises ViaCep::ApiRequestError' do
        expect { ViaCep::Address.new('00000000') }.
          to raise_error(ViaCep::ApiRequestError)
      end
    end
  
    context 'when a nil CEP is passed' do
      it 'raises ArgumentError' do
        expect { ViaCep::Address.new(nil) }.
          to raise_error(ArgumentError)
      end
    end

    context 'when a low timeout is specified' do
      it 'raises a Timeout::Error' do
        expect { ViaCep::Address.new('80210130', timeout: 0.001) }.
          to raise_error(Timeout::Error)
      end
    end

    context 'when a regular timeout is specified' do
      subject(:address) { ViaCep::Address.new('80210130', timeout: 25) }

      it 'returns the Address' do
        expect(address.address).not_to be_empty
      end
    end
  end
end
