source 'https://rubygems.org'

ruby '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'

# Converts LESS files (used in Bootstrap) into SASS
gem 'bootstrap-sass', '2.3.2.0'
# Because most recent version of Sprockets not compatible to this bootstrap-sass version.
gem 'sprockets', '2.11.0'
gem 'bcrypt-ruby', '3.1.2'

# Generate fake names
gem 'faker', '1.1.2'

# For paginating large data sets in an easy way
gem 'will_paginate','3.0.4'
gem 'bootstrap-will_paginate', '0.0.9'

# Use sqlite3 as the database for Active Record
group :development, :test do
   gem 'sqlite3', '1.3.8'
   gem 'rspec-rails'
end
# gem 'sqlite3'

# In order to use Heroku for deploying to production, we need Postgres
group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2' # Needed by Heroku for static assets
end

group :test do
   gem 'selenium-webdriver', '2.35.1'
   gem 'factory_girl_rails', '4.2.1'
   # The following will fail, because nokogiri can not be installed
   # gem 'capybara', '2.1.0'
end

# Use SCSS for stylesheets
gem 'sass-rails',   '4.0.1'
# gem 'sass-rails', '~> 4.0.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '2.1.1'
# gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '4.0.1'
# gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '3.0.4'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '1.1.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '0.3.20', { require: false,  group: :doc }

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

