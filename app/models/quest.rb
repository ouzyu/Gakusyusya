class Quest < ApplicationRecord
  belongs_to :user
  belongs_to :ability
  belongs_to :actor
  belongs_to :map

  validates :content, presence: true, length: { minimum: 1 }

  def quest_time_to_minutes
    self.set_seconds / 60
  end

end
