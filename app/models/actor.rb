class Actor < ApplicationRecord
  has_many :situations, dependent: :destroy
  has_many :users, dependent: :destroy
end
