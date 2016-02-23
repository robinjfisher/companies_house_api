require 'spec_helper'

describe CompaniesHouse::Base do

  let(:subject) {CompaniesHouse::Base}

  it "should set the API_URL" do
    expect(subject::API_URL).to_not be_nil
  end

end
