require 'httparty'
require 'timeout'

module ViaCep
  class Service
    BASE_URI = 'https://viacep.com.br/ws'

    def self.fetch(cep, timeout = nil)
      Timeout::timeout(timeout) do
        response = HTTParty.get("#{BASE_URI}/#{cep}/json")
        if response.success? && !response.parsed_response['erro']
          response.parsed_response
        end
      end
    end
  end
end