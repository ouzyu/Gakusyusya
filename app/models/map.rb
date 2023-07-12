class Map < ApplicationRecord

  has_one_attached :image

  has_many :actors, dependent: :destroy

  validates :name,  presence: true
  validates :image, presence: true, blob: { content_type: :image }
end
