class Shopify::DownsyncWorker
  include Sidekiq::Worker

  def perform
    Shop.find_each { |s| s.downsync }
  end
end
