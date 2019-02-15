require_relative '../lib/viacep'
require_relative './mock/request_mocker'
require 'webmock/rspec'

RSpec.configure do |config|
  config.include ViaCep::Test::RequestMocker

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.order = :random

  config.before(:each) do
    WebMock.reset!
    WebMock.disable_net_connect!
  end
end
