class Map < ApplicationRecord

  has_one_attached :image

  has_many :actors, dependent: :destroy

  validates :name,  presence: true
  validates :image, presence: true, blob: { content_type: :image }

  def get_map_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end

end
