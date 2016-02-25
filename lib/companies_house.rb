require 'yaml'
require 'json'
require 'faraday'
require "companies_house/version"
require 'companies_house/base'
require 'companies_house/configuration'
require 'companies_house/search'
require 'companies_house/company_information'

module CompaniesHouse

  class ApiKeyError < StandardError
  end

  class CompanyNotFoundError < StandardError
  end

end
