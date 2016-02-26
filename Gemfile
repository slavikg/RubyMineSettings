source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', github: 'rails/rails', branch: :master
gem 'arel', github: 'rails/arel'
gem 'rack', github: 'rack/rack'

gem 'puma'

# Use postgresql as the database for Active Record
gem 'pg'

gem 'haml-rails', '~> 0.9'

# manage environment specific settings
gem 'config'

# Assets
gem 'sass-rails', github: 'rails/sass-rails', branch: '5-0-stable'

gem 'sprockets-es6'
gem 'autoprefixer-rails'

gem 'uglifier', '>= 1.3.0'

gem 'jquery-ui-sass-rails'

gem 'font-awesome-rails'

# Authentication & Authorization
gem 'devise', github: 'plataformatec/devise', branch: :master

gem 'pundit'


# for background job processing
gem 'sidekiq'

# Pagination
gem 'kaminari', github: 'amatsuda/kaminari', branch: :master

group :production, :staging do
  gem 'rails_stdout_logging'
  gem 'heroku-deflater'
  gem 'rack-cache'
  gem 'dalli'
  gem 'kgio'
end

group :development do
  gem 'quiet_assets'
  gem 'spring'

  # Evaluate code in error context
  gem 'better_errors'
  gem 'binding_of_caller'

  # Code styles checkers
  gem 'rubocop', require: false

  # In order to enable faster reloading mode
  gem 'listen', '~> 3.0.4'
end

group :test do
  gem 'minitest-rails', github: 'blowmage/minitest-rails', branch: 'rails5'
  gem 'minitest-reporters', '>= 0.5.0'

  # Integration tests
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'minitest-rails-capybara', github: 'blowmage/minitest-rails-capybara', branch: 'rails5'
  gem 'launchy' # Used to simplify debugging of Capybara tests
  gem 'thin' # Run capybara tests on thin server

  # Test coverage
  gem 'simplecov'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin jruby)

source 'https://rails-assets.org' do
  gem 'rails-assets-es5-shim'
  gem 'rails-assets-coffeescript'
  gem 'rails-assets-jquery'
  gem 'rails-assets-jquery-ujs'
  gem 'rails-assets-underscore'
  gem 'rails-assets-bootstrap-sass', '~> 3.3.5'
end
