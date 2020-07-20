require 'net/http'
require 'uri'
require 'json'
require 'timeout'
require_relative 'exceptions'

module ViaCep
  class Service
    BASE_URL = 'https://viacep.com.br/ws'.freeze

    #
    # Fetches the ViaCEP API to request a CEP.
    #
    # @example Fetch a CEP with no timeout.
    #   ViaCep::Service.fetch('80210130', nil)
    #   #=> {"cep"=>"80210-130", "logradouro"=>"Rua José Ananias Mauad", "complemento"=>"", "bairro"=>"Jardim Botânico", "localidade"=>"Curitiba", "uf"=>"PR", "unidade"=>"", "ibge"=>"4106902", "gia"=>""}
    #
    # @example Fetch a CEP with a timeout of 30 seconds.
    #   ViaCep::Service.fetch('80210130', 30)
    #   #=> {"cep"=>"80210-130", "logradouro"=>"Rua José Ananias Mauad", "complemento"=>"", "bairro"=>"Jardim Botânico", "localidade"=>"Curitiba", "uf"=>"PR", "unidade"=>"", "ibge"=>"4106902", "gia"=>""}
    #
    # @param [String] cep The CEP to be fetched.
    # @param [Integer, nil] timeout The timeout in seconds for the request to be finished.
    #
    # @raise [ViaCep::ApiRequestError] This is raised when the external API is down or the CEP does not exist.
    # @raise [Timeout::Error] This is raised when the timeout argument is specified and the request timed out.
    #
    # @return [Hash]
    #
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
