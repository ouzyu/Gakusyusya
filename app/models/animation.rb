class Animation < ApplicationRecord
  belongs_to :situation

  has_one_attached :image

end
