require_relative 'boot'

require 'rails/all'
require 'dotenv' ; Dotenv.load ".env"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Watch2u
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    I18n.available_locales = [:en, :ar]
    config.i18n.default_locale = :en
    config.autoload_paths += %W(\#{config.root}/lib)

    config.generators do |g|
	    g.test_framework :rspec, fixture: true
	    g.fixture_replacement :factory_bot, dir: 'spec/factories'
	    g.view_specs false
	    g.helper_specs false
	    g.stylesheets = false
	    g.javascripts = false
	    g.helper = false
	  end
  end
end
