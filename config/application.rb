require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tennoten
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    # デフォルトでslimが生成されるように
    config.generators.template_engine = :slim

    # i18n国際化対応
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja
    # i18nの複数ロケールファイルが読み込まれるようパスを通す
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    config.generators do |g|
      g.assets false # CSS,JSを自動生成しない
      g.test_framework false # テストを自動生成しない
      g.skip_routes true # ルーティングを自動生成しない
    end
  end
end
