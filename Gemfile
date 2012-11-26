source 'https://rubygems.org'

gem 'rails', '3.2.3'# core rails
gem 'bootstrap-sass','2.0.0' #apperance

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3','1.3.5' #database
gem 'gravatar_image_tag', '1.0.0.pre2'
gem 'rspec-rails','2.10.0' #tests
gem 'bcrypt-ruby', '3.0.1' #encription utilities
gem 'annotate', '2.5.0', group: :development #doccumentation
gem 'faker', '1.0.1' # create fake users
gem 'will_paginate', '3.0.3' # pagination
gem 'bootstrap-will_paginate', '0.0.6' #pagination styling

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.4' #css pre processing
  gem 'coffee-rails', '3.2.2' #javascript preprocessing

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '1.2.3' #javascript compressor
end

gem 'jquery-rails'

group :test do
  gem 'capybara','1.1.2' #easy readable tests
  gem 'factory_girl_rails', '1.4.0' #create objects for tests
  gem 'cucumber-rails', '1.2.1', require: false #easy to understand tests
  gem 'database_cleaner', '0.7.0' #cleaning before tests
end

group :production do
  gem 'pg', '0.12.2' #postgres database
end
# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'