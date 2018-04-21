require 'service'

module ViaCep
  class Address
    attr_reader :cep, :address, :neighborhood, :city, :state, :ibge, :gia

    def initialize(cep, options = {})
      cep = cep.delete('^0-9')
      fill_from_response(Service.fetch(cep, options[:timeout]))
    end

    private

    def fill_from_response(response)
      @cep          = response['cep']
      @address      = response['logradouro']
      @neighborhood = response['bairro']
      @city         = response['localidade']
      @state        = response['uf']
      @ibge         = response['ibge']
      @gia          = response['gia']
    end
  end
end
