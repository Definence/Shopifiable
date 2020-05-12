uri = ENV["REDISTOGO_URL"] || "redis://localhost:6379/"
REDIS = Redis.new(:url => uri)

Sidekiq.configure_server do |config|
  config.redis = { url: uri }
  config.average_scheduled_poll_interval = 5
end

Sidekiq.configure_client do |config|
  config.redis = { url: uri }
end
