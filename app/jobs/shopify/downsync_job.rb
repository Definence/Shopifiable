class Shopify::DownsyncJob < ApplicationJob
  def perform(method, args)
    self.send(method, args.symbolize_keys)
  end

  private

  def collections args
    Shop::Collection.downsync_all! args[:local_shop]
  end

  def products args
    Shop::Product.downsync_all! args[:local_shop]
  end
end
