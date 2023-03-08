class Comment < ApplicationRecord
  validates :text, presence: true,
                   length: { maximum: 2200, too_long: '%<count>s characters is the maximum allowed' }
end
