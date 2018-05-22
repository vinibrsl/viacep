RSpec.describe ViaCep::Service do
  it 'should have a base URL' do
    expect(ViaCep::Service::BASE_URL).not_to be_empty
  end

  describe '.fetch' do
    context 'when a small timeout is specified' do
      it 'raises Timeout::Error' do
        expect { ViaCep::Service.fetch('80210130', 0.001) }.
          to raise_error(Timeout::Error)
      end
    end

    context 'when a suficient timeout is specified' do
      subject(:response) { ViaCep::Service.fetch('80210130', 25) }

      it 'returns the response' do
        expect(response).not_to be_empty
      end
    end

    context 'when a invalid CEP is passed' do
      it 'raises ViaCep::ApiRequestError' do
        expect { ViaCep::Service.fetch('000000', nil) }.
          to raise_error(ViaCep::ApiRequestError)
      end
    end
  end
end
