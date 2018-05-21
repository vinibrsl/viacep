require 'net/http'
require 'uri'
require 'json'
require 'timeout'
require 'exceptions'

module ViaCep
  class Service
    BASE_URL = 'https://viacep.com.br/ws'.freeze

    # Fetches the ViaCEP API to request a CEP
    def self.fetch(cep, timeout)
      Timeout.timeout(timeout) do
        uri = URI("#{BASE_URL}/#{cep}/json")
        request = Net::HTTP.get_response(uri)

        if request.code == '200'
          response = JSON.parse(request.body)

          if response["erro"]
            raise ApiRequestError, "The server responded with HTTP 200 could not process the request"
          end

          response
        else
          raise ApiRequestError, "The server responded with HTTP #{request.code}"
        end
      end
    end
  end
end
