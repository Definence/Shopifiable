class Shopify::DownsyncJob < ApplicationJob
  def perform(method, args)
    self.send(method, args.symbolize_keys)
  end

  private

  def collection args
    shop = Shop.find(args[:id])
    shop.downsync!
  end
end
