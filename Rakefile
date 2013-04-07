task :environment do
  require File.join('.','config','env.rb')
end

desc "Run App in Pry console"
task :console, :environment do |t, args|
  ENV['RACK_ENV'] = args[:environment] || 'development'
 
  exec "pry -r ./config/env.rb"
end

namespace :db do

  desc "destructive bootstrap of the db"
  task :bootstrap => :environment do
    DataMapper.auto_migrate!
  end

  desc "non-destructive migration of the db"
  task :migrate => :environment do
    DataMapper.auto_upgrade!
  end
  
end

namespace :styles do
  
  desc "Clear the styles"
  task :clear => ["compile:clear"]

  desc "Watch the styles and compile new changes"
  task :watch do
    system "compass watch"
  end
  
  desc "List the styles"
  task :list do
    system "ls -lh public/stylesheets"
  end
  
  desc "Compile new styles"
  task :compile => ["compile:default"]

  namespace :compile do
    
    # task :clear do
    #   puts "*** Clearing styles ***"
    #   system "rm -Rfv public/stylesheets/*"
    # end

    task :default do
      puts "*** Compiling styles ***"
      system "compass compile"
    end

    desc "Compile new styles for production"
    task :production do
      puts "*** Compiling styles ***"
      system "compass compile --output-style compressed --force"
    end

  end
  
end