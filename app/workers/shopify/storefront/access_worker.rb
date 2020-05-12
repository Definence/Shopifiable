class Shopify::Storefront::AccessWorker
  include Sidekiq::Worker

  def perform(args)
    Shopify::Storefront::AccessGenerationService.new(args.symbolize_keys).call
  end
end
