ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/pride'

class ActiveSupport::TestCase
  fixtures :all
end

# Requires supporting ruby files with custom matchers and macros, etc,
# in test/support/ and its subdirectories.
Dir[Rails.root.join('test/support/**/*.rb')].each { |f| require f }

if ENV['COVERAGE'] || ENV['CIRCLE_ARTIFACTS']
  require 'simplecov'
  if ENV['CIRCLE_ARTIFACTS']
    dir = File.join('..', '..', '..', ENV['CIRCLE_ARTIFACTS'], 'coverage')
    SimpleCov.coverage_dir(dir)
  end

  SimpleCov.start 'rails'
end
