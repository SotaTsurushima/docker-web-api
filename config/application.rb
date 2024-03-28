require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RakuSearch
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.autoload_paths += %W(#{config.root}/lib)
    
    # 特にここ！！Rails5から productionでも呼び出せるように設定しないといけない
    config.enable_dependency_loading = true 
  end
end

