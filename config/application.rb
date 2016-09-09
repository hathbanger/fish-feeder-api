require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FishFeederApi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    $device_status_codes = {
        100 => "idle",
        101=> "feeding"
    }
    $device_response_codes = {
        200 => "success",
        404 => "..."
    }
  end
end


