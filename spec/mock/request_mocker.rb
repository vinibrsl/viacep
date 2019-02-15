require 'webmock/rspec'

module ViaCep
  module Test
    module RequestMocker
      def mock_viacep_success
        WebMock.stub_request(:get, /viacep/).to_return(File.new("#{__dir__}/viacep_success.txt"))
      end

      def mock_viacep_not_found
        WebMock.stub_request(:get, /viacep/).to_return(File.new("#{__dir__}/viacep_not_found.txt"))
      end

      def mock_viacep_invalid_format
        WebMock.stub_request(:get, /viacep/).to_return(File.new("#{__dir__}/viacep_invalid_format.txt"))
      end

      def mock_viacep_slow_success(delay_in_seconds:)
        success = lambda do |request|
          sleep delay_in_seconds
          File.new("#{__dir__}/viacep_success.txt")
        end

        WebMock.stub_request(:get, /viacep/).to_return(success)
      end
    end
  end
end
