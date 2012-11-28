if Rails.env == 'development'
  module DataEngineering
    class Application < Rails::Application
      Mongoid.logger.level = Logger::DEBUG
      Moped.logger.level = Logger::DEBUG
    end
  end
end