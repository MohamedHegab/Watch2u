# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'shoulda-matchers'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'rack/test'
require 'devise'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
  
  config.include Devise::Test::ControllerHelpers, :type => :controller
  
  config.extend ControllerMacros, :type => :controller
  
  config.include Request::JsonHelpers, :type => :controller
  
  config.include Request::HeadersHelpers, :type => :controller

  config.before(:each, type: :controller) do
    include_default_accept_headers
  end
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.render_views = true

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec

    # Or, choose the following (which implies all of the above):
    with.library :rails
  end
end