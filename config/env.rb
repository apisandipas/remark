require 'bundler/setup'
Bundler.require
TIMEZONE = 'US/Central'

module BP
  module Sinatra
    class Base < ::Sinatra::Base
      set :root, File.join(File.expand_path(File.join(File.dirname(__FILE__))), '..')
      set :public_folder, 'public'


      require File.join(root, 'app.rb')
    end
  end
end

puts "Starting in #{Sinatra::Base.environment} mode #{Time.now} (#{TIMEZONE})"