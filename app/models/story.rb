class Story < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def image_url
    return unless image.attached?

    Rails.application.routes.url_helpers.url_for(image)
  end

  def story_user
    image = Rails.application.routes.url_helpers.url_for(user.image) if user.image.attached?
    {
      id: user.id,
      name: user.name,
      email: user.email,
      image:
    }
  end
end
