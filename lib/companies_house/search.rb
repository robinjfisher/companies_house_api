module CompaniesHouse

  class Search < Base

    # request = CompaniesHouse::Search.new

    def initialize
      super
    end

    # search_companies
    # https://developer.companieshouse.gov.uk/api/docs/search/companies/companysearch.html
    # response = request.search_companies(query_string,items_per_page,start_index)
    # query_string is a string to be searched for
    # items_per_page is a string setting how many items to return per page
    # start_index is a string representing the index of the first result item to return
    # response.companies_count returns the number of companies found for the given query string
    # response.companies returns an array of OpenStruct objects representing the company information found for the given query string

    def search_companies(q="captured sparks",items_per_page="50",start_index="0")
      # GET /search/companies
      query_string = "?q=#{q}&items_per_page=#{items_per_page}"
      unless start_index.nil?
        query_string << "&start_index=#{start_index}"
      end
      url = "search/companies#{query_string}"
      response = @@conn.get(url)
      result = JSON.parse(response.body, object_class: OpenStruct)
      return OpenStruct.new({companies_count: result.items.count, companies: result.items})
    end

  end

end
