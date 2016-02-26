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
      if result.respond_to?(:errors)
        if result.errors[0][:error] == "company-profile-not-found"
          raise CompanyNotFoundError.new("A company with that registration number could not be found")
        end
      else
        return result
      end
    end

    def registered_office_address(company_number)
      # GET /company/company_number/registered-office-address
      url = "company/#{company_number}/registered-office-address"
      response = @@conn.get url
      result = JSON.parse(response.body, object_class: OpenStruct)
      if result.respond_to?(:errors)
        if result.errors[0][:error] == "company-profile-not-found"
          raise CompanyNotFoundError.new("A company with that registration number could not be found")
        end
      else
        return result
      end
    end

  end

end
