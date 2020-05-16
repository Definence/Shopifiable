# frozen_string_literal: true

class Shop::Collection < ActiveRecord::Base
  validates_presence_of :title, :handle
  validates_uniqueness_of :title, :handle

  has_many :rules, dependent: :destroy
  has_and_belongs_to_many :products

  def primary?
    rules.count > 1
  end

  def self.downsync_all local_shop
    Shopify::DownsyncJob.perform_later(:collections, local_shop: local_shop)
  end

  def self.downsync_all! local_shop
    Shopify::Downsync::CollectionsService.new(local_shop).call
  end
end
