class Map < ApplicationRecord

  has_one_attached :image

  has_many :actors, dependent: :destroy
end
