# frozen_string_literal: true

class Shop::Product::Variant < ActiveRecord::Base
  validates_presence_of :product_id, :guid, :title
  validates_uniqueness_of :title, :guid, scope: :product_id

  belongs_to :product
end
