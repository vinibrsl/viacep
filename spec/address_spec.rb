require 'spec_helper'

RSpec.describe ViaCep::Address do
  describe '#initialize' do
    context 'when a valid CEP is passed' do
      it 'returns the Address' do
        mock_viacep_success

        address = ViaCep::Address.new('80210130')
        expect(address.address).not_to be_empty
      end
    end

    context 'when a invalid length CEP is passed' do
      it 'raises ArgumentError' do
        expect { ViaCep::Address.new('000000') }
          .to raise_error(ArgumentError)
      end
    end

    context 'when a unexistent CEP is passed' do
      it 'raises ViaCep::ApiRequestError' do
        mock_viacep_not_found
        expect { ViaCep::Address.new('00000000') }
          .to raise_error(ViaCep::ApiRequestError)
      end
    end

    context 'when a nil CEP is passed' do
      it 'raises ArgumentError' do
        expect { ViaCep::Address.new(nil) }
          .to raise_error(ArgumentError)
      end
    end

    context 'when a low timeout is specified' do
      it 'raises a Timeout::Error' do
        mock_viacep_slow_success(delay_in_seconds: 0.01)
        expect { ViaCep::Address.new('80210130', timeout: 0.001) }
          .to raise_error(Timeout::Error)
      end
    end

    context 'when a regular timeout is specified' do
      it 'returns the Address' do
        mock_viacep_success

        address = ViaCep::Address.new('80210130', timeout: 3.0)
        expect(address.address).not_to be_empty
      end
    end
  end
end
