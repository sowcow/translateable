class Text < ActiveRecord::Base
  has_ancestry
  extend FriendlyId
  friendly_id :title, use: :finders
end
