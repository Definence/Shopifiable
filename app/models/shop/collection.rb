# frozen_string_literal: true

class Shop::Collection < ActiveRecord::Base
  validates_presence_of :title, :handle
  validates_uniqueness_of :title, :handle

  has_many :rules, dependent: :destroy
  has_and_belongs_to_many :products

  def primary?
    rules.count > 1
  end
end
