class Comment < ApplicationRecord
  has_many :comment_replies, dependent: :destroy
  belongs_to :user
  belongs_to :post
  has_many :comment_likes

  validates :text, presence: true,
                   length: { maximum: 2200, too_long: '%<count>s characters is the maximum allowed' }
end
