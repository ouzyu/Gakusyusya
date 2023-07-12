class Ability < ApplicationRecord
  belongs_to :user
  has_many :quests, dependent: :destroy

  validates :name, length: { in: 1..15 }
end
