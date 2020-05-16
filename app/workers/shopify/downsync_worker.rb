class Shopify::DownsyncWorker
  include Sidekiq::Worker

  def perform
    Shop.find_each do |local_shop|
      Shop::Collection.downsync_all local_shop.id
      Shop::Product.downsync_all local_shop.id
    end
  end
end
