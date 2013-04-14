require 'bundler/setup'
Bundler.require
TIMEZONE = 'US/Central'

module BP
  module Sinatra
    class Base < ::Sinatra::Base
      configure do
        set :root, File.join(File.expand_path(File.join(File.dirname(__FILE__))), '..')
        set :public_folder, 'public'
        set :show_exceptions, false

        Dir.glob(File.join(root, 'models', '**/*.rb')).each { |f| require f }

        require File.join(root, 'app.rb')
        DataMapper::Logger.new(STDOUT,  :debug)
        DataMapper.finalize
      end

      configure :development do
        Bundler.require :development 
        DataMapper.setup :default, YAML.load_file(File.join(root, 'config', 'database.yml'))[environment.to_s]

      end

      configure :test do
        Bundler.require :test
        DataMapper.setup :default, YAML.load_file(File.join(root, 'config', 'database.yml'))[environment.to_s]
      end
      

      not_found do
        erb :'404'
      end

      error do
        erb :'500'
      end

      # configure :production do
        
      # end


    end
  end
end
