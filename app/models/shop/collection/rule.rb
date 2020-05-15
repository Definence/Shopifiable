# frozen_string_literal: true
class Shop::Collection::Rule < ActiveRecord::Base
  validates_presence_of :column, :relation, :condition, :collection_id
  validates_uniqueness_of :condition, scope: %i[column relation]

  belongs_to :collection
end
