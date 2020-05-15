# frozen_string_literal: true

class Shop::Product < ActiveRecord::Base
  validates :min_price, :max_price, numericality: { greater_than: 0, less_than: 1_000_000 }
  validates_presence_of :shop_id, :guid, :title, :currency, :handle, :min_price, :max_price
  validates_uniqueness_of :guid, :title, :handle, scope: :shop_id

  has_many :images, class_name: 'Image', as: :imageable, dependent: :destroy
  has_and_belongs_to_many :collections

  def self.downsync!(handle, local_shop)
    Shopify::Downsync::Shop::ProductService.new(handle, local_shop).call # TODO add async version
  end
end
