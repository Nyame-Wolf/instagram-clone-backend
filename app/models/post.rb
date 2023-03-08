class Post < ApplicationRecord
  has_many_attached :images
  validates :title,
            length: { maximum: 2200, too_long: '%<count>s characters is the maximum allowed' }
end
