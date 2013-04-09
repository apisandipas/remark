Thrown together to serve as a starter for various weekend projects.

To start in development
  % shotgun 
 
To view available rake tasks  
  % rake -T

Rake tasks currenrly include:
  rake app:console                # Run App in Pry console
  rake db:bootstrap               # Destructive bootstrap of the db
  rake db:migrate                 # Non-destructive migration of the db
  rake styles:clear               # Clear the styles
  rake styles:compile             # Compile new styles
  rake styles:compile:production  # Compile new styles for production
  rake styles:watch               # Watch the styles and compile new changes


Todo: 
  - Incorporate test suite (rspec + shoulda + fabricate?)
  - Build some shit!