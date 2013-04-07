namespace :db do

  desc "Destructive bootstrap of the db"
  task :bootstrap => :environment do
    DataMapper.auto_migrate!
  end

  desc "Non-destructive migration of the db"
  task :migrate => :environment do
    DataMapper.auto_upgrade!
  end
  
end
