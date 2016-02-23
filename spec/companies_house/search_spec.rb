require 'spec_helper'

describe CompaniesHouse::Search do

  let(:subject) {CompaniesHouse::Search}

  before(:each) do
    CompaniesHouse.configure do |config|
      # config.api_key = "l-KnFlO6MXhnLq-Dtwcz56sOWqakyR7xqt2UlC6i"
      config.api_key = "fdfkjsdkfgsdjhfdsjhgfsd"
    end
  end

  describe ".search_companies" do

    before do
      url = "https://fdfkjsdkfgsdjhfdsjhgfsd:@api.companieshouse.gov.uk/search/companies?items_per_page=50&q=captured%20sparks&start_index=0"
      stub_request(:get, url).to_return(
        :body => load_fixture("search_companies.json"),
        :status => 200
      )
      @response = subject.new.search_companies
    end

    it "should return the number of results" do
      expect(@response.companies_count).to eq(1)
    end

  end

end
