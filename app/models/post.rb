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
      image:
    }
  end

  def post_comments
    comments_arr = []
    comments.each do |comment|
      comment_replies_arr = []
      comment.comment_replies.each do |item|
        new_image = Rails.application.routes.url_helpers.url_for(item.user.image) if item.user.image.attached?
        comment_replies_arr << {
          id: item.id,
          text: item.text,
          created_at: item.created_at,
          user: {
            id: item.user.id,
            name: item.user.name,
            email: item.user.email,
            image: new_image
          }
        }
      end

      comment_image = Rails.application.routes.url_helpers.url_for(comment.user.image) if comment.user.image.attached?
      comments_arr << {
        id: comment.id,
        text: comment.text,
        created_at: comment.created_at,
        user: {
          id: comment.user.id,
          name: comment.user.name,
          email: comment.user.email,
          image: comment_image
        },
        comment_likes: comment.comment_likes,
        comment_replies: comment_replies_arr
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
          email: like.user.email
        }
      }
    end
    likes_arr
  end
end
