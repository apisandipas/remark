namespace :app do
  desc "Run App in Pry console"
  task :console => :environment do |t, args|
    ENV['RACK_ENV'] = args[:environment] || 'development'
    system "pry -r ./config/env.rb"
  end
end