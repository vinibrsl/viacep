require 'httparty'
require 'timeout'
require 'exceptions'

module ViaCep
  class Service
    BASE_URI = 'https://viacep.com.br/ws'

    def self.fetch(cep, timeout = nil)
      Timeout::timeout(timeout) do
        response = HTTParty.get("#{BASE_URI}/#{cep}/json")
        if response.code == 404 || response.parsed_response['erro']
          raise AddressNotFound, 'the API responded with HTTP 404'
        else
          response.parsed_response
        end
      end
    end
  end
end
