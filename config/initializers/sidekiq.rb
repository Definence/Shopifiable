# uri = Rails.env.development? ? "redis://localhost:6379/" : ENV["REDISTOGO_URL"]
# REDIS = Redis.new(url: uri)

# # Sidekiq.configure_server do |config|
# #   config.redis = { url: uri }
# #   config.average_scheduled_poll_interval = 5
# # end

# # Sidekiq.configure_client do |config|
# #   config.redis = { url: uri }
# # end
