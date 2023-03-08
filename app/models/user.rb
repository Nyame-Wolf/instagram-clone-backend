class User < ApplicationRecord
  has_one_attached :image
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true, uniqueness: true,
                   length: { maximum: 30, too_long: '%<count>s characters is the maximum allowed' }
end
