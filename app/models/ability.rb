class Ability < ApplicationRecord
  belongs_to :user
  has_many :quests, dependent: :destroy

  validates :name, presence: true, length: { in: 1..15 }
end
