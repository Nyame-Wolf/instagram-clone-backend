class Post < ApplicationRecord
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user

  validates :title,
            length: { maximum: 2200, too_long: '%<count>s characters is the maximum allowed' }
end
