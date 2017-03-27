require_relative 'boot'

require 'rails/all'
# config.assets.initialize_on_precompile = false

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WesAdmits
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.exceptions_app = self.routes
    config.time_zone = 'Eastern Time (US & Canada)'
    # TIMEZONES: http://stackoverflow.com/questions/6118779/how-to-change-default-timezone-for-active-record-in-rails
  end
end
