module CompaniesHouse

  class Base

    API_URL = "https://api.companieshouse.gov.uk/"

    attr_accessor :api_key

    def initialize
      if CompaniesHouse.configuration.nil?
        raise ApiKeyError.new("You have not set an API key")
      end
      self.api_key = CompaniesHouse.configuration.api_key
      @@conn = Faraday.new(:url => API_URL) do |faraday|
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
      @@conn.headers[:authorization] = "#{@api_key}"
      @@conn.basic_auth("#{api_key}","")
    end

  end

end
