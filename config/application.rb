require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Recombee
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.cache_store = :redis_store, 'redis://159.89.80.118:6379/0/cache', {
      expires_in: 90.minutes
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin': 'http://localhost:3001, https://localhost:3001',
      'Access-Control-Request-Method': %w{GET OPTIONS}.join(","),
      'Access-Control-Expose-Headers': 'Link',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  end
end
