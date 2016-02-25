module CompaniesHouse

#   CompaniesHouse.configure do |config|
#     config.api_key = '837432u32hlfkwjhkljehw'
#   end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration

    attr_accessor :api_key

    def initialize
      @api_key = "example_api_key"
    end

  end

end
