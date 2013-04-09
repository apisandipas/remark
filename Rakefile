task :environment do
  require File.join('.','config','env.rb')
end

Dir["tasks/*.rake"].sort.each { |ext| load ext }

desc "Run specs"
task :spec do
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = './spec/**/*_spec.rb'
  end
end


