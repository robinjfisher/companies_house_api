module CompaniesHouse

  class CompanyInformation < Base

    def initialize
      super
    end

    def company_profile(company_number)
      # GET /company/company_number
      url = "company/#{company_number}"
      response = @@conn.get url
      result = JSON.parse(response.body, object_class: OpenStruct)
      return result
    end

  end

end
