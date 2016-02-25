require 'spec_helper'

describe CompaniesHouse::CompanyInformation do

  let(:subject) {CompaniesHouse::CompanyInformation}

  before(:each) do
    CompaniesHouse.configure do |config|
      config.api_key = "fdfkjsdkfgsdjhfdsjhgfsd"
    end
  end

  describe "company_profile" do

    context "when a valid company number is provided" do

      before do
        url = "https://fdfkjsdkfgsdjhfdsjhgfsd:@api.companieshouse.gov.uk/company/07577596"
        stub_request(:get, url).to_return(
          :body => load_fixture("company_profile.json"),
          :status => 200
        )
        @response = subject.new.company_profile("07577596")
      end

      it 'should return a PORO' do
        expect(@response).to be_an(OpenStruct)
      end

      it 'should respond to dot methods' do
        expect(@response.company_name).to match(/captured sparks/i)
      end

    end

  end

end
