class Situation < ApplicationRecord
  belongs_to :actor
  has_many :animations, dependent: :destroy
end
