class Actor < ApplicationRecord
  has_many :situations, dependent: :destroy
end
