class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, presence: true,
                   length: { maximum: 2200, too_long: '%<count>s characters is the maximum allowed' }
end
