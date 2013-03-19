require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require *Rails.groups(:assets) if defined?(Bundler)

module ChicagoFoodInspections
  class Application < Rails::Application
    config.eager_load_paths += %w(lib).map do |path|
      "#{config.root}/#{path}"
    end

    config.time_zone = 'Central Time (US & Canada)'

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = 'utf-8'

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # Enable the asset pipeline
    config.assets.enabled = true

    # prevent initializing application and connecting to the database
    config.assets.initialize_on_precompile = false

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    # Enable caching resources
    ActionController::Base.perform_caching = true
  end
end
