$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'companies_house'
require 'webmock/rspec'

RSpec.configure do |config|

  config.before(:suite) do
    # Disable all live HTTP requests
    WebMock.disable_net_connect!(allow_localhost: true)
  end

  config.mock_with :mocha
end

def load_fixture(*filename)
  File.open(File.join('spec', 'data', *filename)).read
end
