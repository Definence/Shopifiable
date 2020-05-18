# frozen_string_literal: true

class Shop::Product < ActiveRecord::Base
  validates :min_price, :max_price, numericality: { greater_than: 0, less_than: 1_000_000 }
  validates_presence_of :shop_id, :guid, :title, :currency, :handle, :min_price, :max_price
  validates_uniqueness_of :guid, :handle, scope: :shop_id

  has_many :images, class_name: 'Image', as: :imageable, dependent: :destroy
  has_many :variants, dependent: :destroy
  has_and_belongs_to_many :collections

  def price_range
    [min_price, max_price].uniq
  end

  def min_price
    '%.2f' % super.to_f
  end

  def max_price
    '%.2f' % super.to_f
  end

  def self.downsync_all(local_shop)
    Shopify::DownsyncJob.perform_later(:products, local_shop: local_shop)
  end

  def self.downsync_all!(local_shop)
    Shopify::Downsync::ProductsService.new(local_shop).call
  end

  def self.downsync!(handle, local_shop)
    Shopify::Downsync::ProductService.new(handle, local_shop).call
  end
end
