require 'bundler/setup'
Bundler.require
TIMEZONE = 'US/Central'

module BP
  module Sinatra
    class Base < ::Sinatra::Base
      configure do
        set :root, File.join(File.expand_path(File.join(File.dirname(__FILE__))), '..')
        set :public_folder, 'public'
        set :method_override, true
        set :raise_errors,    false
        set :show_exceptions, false
        set :sessions,        true
        set :session_secret,  'b2upc49fbr03n3odhf02nfd78fn'
        set :erb,             :escape_html => true

        mime_type :ttf, 'font/ttf'
        mime_type :woff, 'application/octet-stream'

        Dir.glob(File.join(root, 'models', '**/*.rb')).each { |f| require f }
        Dir.glob(File.join(root, 'lib', '**/*.rb')).each { |f| require f }
        register CoreHelpers
    
        require File.join(root, 'app.rb')

        DataMapper::Logger.new(STDOUT,  :debug)
        DataMapper.finalize
      end

      configure :development do
        use Rack::CommonLogger
        Bundler.require :development 
        DataMapper.setup :default, YAML.load_file(File.join(root, 'config', 'database.yml'))[environment.to_s]

      end

      configure :test do
        use Rack::CommonLogger
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
