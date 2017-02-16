require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TabiProject
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
	
	config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
	config.assets.paths << Rails.root.join('/app/assets/fonts')

        # Load /lib folder
        config.autoload_paths << Rails.root.join('lib')
  end
end
