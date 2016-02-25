# CompaniesHouse

The CompaniesHouse gem provides a wrapper around the Companies House API. Two methods are currently provided. One to search the Companies House database against a given string. The second to retrieve company information given a company number.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'companies_house_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install companies_house_api

## Usage

An API key is required which can be obtained by registering with [Companies House](https://developer.companieshouse.gov.uk/api/docs/index/gettingStarted/apikey_authorisation.html).

Configure the gem using a block in an initializer:

```ruby
CompaniesHouse.configure do |config|
  config.api_key = "your_api_key_here"
end
```

Planning ahead for future development, there are two classes, `Search` and `Company Information`.

To search for company information, configure as above and then instantiate a new instance of the `Search` class.

```ruby
ch = CompaniesHouse::Search.new
ch.search_companies("captured sparks")
```

This returns a plain ruby object with two attributes: a count of how many results are returned for the search and an array of those results.

To retrieve company information:

```ruby
ch = CompaniesHouse::CompanyInformation.new
ch.company_profile("07577596")
```

Again, this return a plain ruby object with attributes as shown in the API documentation e.g. `company_name`.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/companies_house_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
