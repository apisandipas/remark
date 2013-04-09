ENV['RACK_ENV'] = "test"
require "SimpleCov"
SimpleCov.start

def app; App; end

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end