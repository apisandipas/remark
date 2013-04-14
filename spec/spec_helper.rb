ENV['RACK_ENV'] = "test"
require "SimpleCov"
SimpleCov.start
require File.join File.dirname(__FILE__), *%w[.. config env]
require 'rack/test'

def app; App; end

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end