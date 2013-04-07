namespace :styles do
  
  desc "Clear the styles"
  task :clear => ["compile:clear"]

  desc "Watch the styles and compile new changes"
  task :watch do
    system "compass watch"
  end
    
  desc "Compile new styles"
  task :compile => ["compile:default"]

  namespace :compile do
    
    task :clear do
      puts "*** Clearing styles ***"
      system "rm -Rfv public/css/*"
    end

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