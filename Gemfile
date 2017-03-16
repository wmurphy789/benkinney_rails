source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.8'
# Use sqlite3 as the database for Active Record
gem 'mysql2', '0.3.19'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'font-awesome-rails'
gem 'devise-bootstrap-views'
gem 'bootstrap-sass', '~> 3.3.7'

source 'https://rails-assets.org' do
  gem 'rails-assets-angular'
  gem 'rails-assets-toastr'
end

gem 'will_paginate', '3.0.7'
gem "will_paginate_renderers"
gem "will_paginate-bootstrap"

gem "devise", "3.5.1"
gem 'devise_invitable', '~> 1.5.3'
gem 'devise_token_auth', '~> 0.1.34'
gem 'omniauth', '1.2.2'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'guard-rspec', require: false
  gem 'rails_layout'
end

group :development, :test do

  gem 'faker' # lets get some random seeds :D
  gem 'rspec-rails', '~> 3.2'
  gem 'rspec_junit_formatter'
  gem 'factory_girl_rails'

  gem 'to_factory' # generate model fixtures
  gem 'schema_to_scaffold' # generate model fixtures
  gem 'letter_opener'
  gem 'byebug'
  gem 'capybara'

end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.0.1'
  gem 'simplecov'
  gem 'simplecov-bamboo', require: false

end