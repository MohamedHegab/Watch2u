source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise', '~> 4.4', '>= 4.4.3'
gem 'rails_admin', '~> 1.3'
gem 'dotenv', '~> 2.2', '>= 2.2.1'
gem 'jwt', '~> 1.5', '>= 1.5.4'
gem 'paperclip'
gem 'friendly_id', '~> 5.1'
gem 'ransack'
gem 'enumerize'
gem 'rest-client', '~> 2.0', '>= 2.0.2'
gem 'config'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'guard-rspec', '4.4.2'
  gem 'shoulda'
  gem 'simplecov', :require => false

end

group :development do
  gem 'annotate'
	gem 'better_errors', '~> 2.4'
  gem "binding_of_caller"
  gem "letter_opener"
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
