class Post < ApplicationRecord
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user

  validates :title,
            length: { maximum: 2200, too_long: '%<count>s characters is the maximum allowed' }

  def image_urls
    images.attached? ? images.map { |image| Rails.application.routes.url_helpers.url_for(image) } : []
  end

  def post_user
    user = User.includes(:image_attachment).find_by(id: user_id)
    image = Rails.application.routes.url_helpers.url_for(user.image) if user.image.attached?
    {
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
      image:
    }
  end

  def post_comments
    comments.includes(user: { image_attachment: :blob }, comment_replies: { user: { image_attachment: :blob } }).map do |comment|
      comment_replies_arr = comment.comment_replies.map do |item|
        {
          id: item.id,
          text: item.text,
          created_at: item.created_at,
          user: {
            id: item.user.id,
            name: item.user.name,
            username: item.user.username,
            email: item.user.email,
            image: item.user.image.attached? ? Rails.application.routes.url_helpers.url_for(item.user.image) : nil
          }
        }
      end

      {
        id: comment.id,
        text: comment.text,
        created_at: comment.created_at,
        user: {
          id: comment.user.id,
          name: comment.user.name,
          username: comment.user.username,
          email: comment.user.email,
          image: comment.user.image.attached? ? Rails.application.routes.url_helpers.url_for(comment.user.image) : nil
        },
        comment_likes: comment.comment_likes,
        comment_replies: comment_replies_arr
      }
    end
  end

  def post_likes
    likes.includes(:user).map do |like|
      {
        id: like.id,
        user: {
          id: like.user.id,
          name: like.user.name,
          email: like.user.email
        }
      }
    end
  end
end
