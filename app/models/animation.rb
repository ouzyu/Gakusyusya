class Animation < ApplicationRecord
  belongs_to :situation

  has_one_attached :image

  validates :image, presence: true, blob: { content_type: :image }

  def get_animation_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end

end
