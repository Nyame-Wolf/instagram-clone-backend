class Post < ApplicationRecord
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user

  validates :title,
            length: { maximum: 2200, too_long: '%<count>s characters is the maximum allowed' }

  def image_urls
    if images.attached?
      images = []
      self.images.each do |image|
        images << Rails.application.routes.url_helpers.url_for(image)
      end
    end
    images
  end

  def post_user
    image = Rails.application.routes.url_helpers.url_for(user.image) if user.image.attached?

    {
      id: user.id,
      name: user.name,
      email: user.email,
      created_at: user.created_at,
      updated_at: user.updated_at,
      image:
    }
  end

  def post_comments
    comments_arr = []
    comments.each do |comment|
      comments_arr << {
        id: comment.id,
        text: comment.text,
        user: {
          id: comment.user.id,
          name: comment.user.name,
          email: comment.user.email,
          created_at: comment.user.created_at,
          updated_at: comment.user.updated_at
        }
      }
    end
    comments_arr
  end

  def post_likes
    likes_arr = []
    likes.each do |like|
      likes_arr << {
        id: like.id,
        user: {
          id: like.user.id,
          name: like.user.name,
          email: like.user.email,
          created_at: like.user.created_at,
          updated_at: like.user.updated_at
        }
      }
    end
    likes_arr
  end
end
