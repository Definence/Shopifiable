# frozen_string_literal: true

class Image < ActiveRecord::Base
  validates_presence_of :ext_url, :imageable_id, :imageable_type
end
