require_relative 'service'

module ViaCep
  class Address
    attr_reader :cep, :address, :neighborhood, :city, :state, :ibge, :gia

    #
    # Initializes an instance of ViaCep::Address and fetches the CEP using the external API.
    #
    # @example Fetch a CEP
    #   ViaCep::Address.new('80210130')
    #   #=> #<ViaCep::Address:0x00007fe52a8a0568 @cep="80210-130", @address="Rua José Ananias Mauad", @neighborhood="Jardim Botânico", @city="Curitiba", @state="PR", @ibge="4106902", @gia="">
    #
    # @example Fetch a CEP with a formatted string
    #   ViaCep::Address.new('80210-130')
    #   #=> #<ViaCep::Address:0x00007fe52a8a0568 @cep="80210-130", @address="Rua José Ananias Mauad", @neighborhood="Jardim Botânico", @city="Curitiba", @state="PR", @ibge="4106902", @gia="">
    #
    # @param [String] cep The CEP to be fetched.
    # @option options [Integer] :timeout The timeout in seconds to the request.
    #
    # @raise [ArgumentError] This is raised when CEP is nil.
    # @raise [ArgumentError] This is raised when CEP format is invalid.
    # @raise [ViaCep::ApiRequestError] This is raised when the external API is down or the CEP does not exist.
    # @raise [Timeout::Error] This is raised when the timeout argument is specified and the request timed out.
    #
    # @return [ViaCep::Address]
    #
    def initialize(cep, options = {})
      if cep.nil?
        raise ArgumentError, 'CEP cannot be nil'
      end

      cep = cep.to_s.delete('^0-9')

      if cep.length != 8
        raise ArgumentError, 'CEP must have 8 digits'
      end

      response = Service.fetch cep, options[:timeout]
      fill_from response
    end

    private

    def fill_from(response)
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
