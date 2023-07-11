class Quest < ApplicationRecord
  belongs_to :user
  belongs_to :ability
  belongs_to :actor
  belongs_to :map

  def quest_time_minutes
    self.seconds / 60
  end

end
