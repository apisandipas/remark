require File.join(File.expand_path(File.dirname(__FILE__)), 'config', 'env.rb')

map '/' do
  run App
end