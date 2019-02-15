require 'spec_helper'

RSpec.describe ViaCep::Service do
  it 'should have a base URL' do
    expect(ViaCep::Service::BASE_URL).not_to be_empty
  end

  describe '.fetch' do
    context 'when a small timeout is specified' do
      it 'raises Timeout::Error' do
        mock_viacep_slow_success(delay_in_seconds: 0.01)
        expect { ViaCep::Service.fetch('80210130', 0.001) }
          .to raise_error(Timeout::Error)
      end
    end

    context 'when a suficient timeout is specified' do
      it 'returns the response' do
        mock_viacep_success
        response = ViaCep::Service.fetch('80210130', 5.0)
        expect(response).not_to be_empty
      end
    end

    context 'when a invalid CEP is passed' do
      it 'raises ViaCep::ApiRequestError' do
        mock_viacep_invalid_format
        expect { ViaCep::Service.fetch('000000', nil) }
          .to raise_error(ViaCep::ApiRequestError)
      end
    end
  end
end
