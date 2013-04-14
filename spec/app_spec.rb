require 'spec_helper'

describe 'App' do
  
  it "gets the root of the application" do
    get '/'
    last_response.should be_ok
  end

end