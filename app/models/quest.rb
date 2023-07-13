class Quest < ApplicationRecord
  belongs_to :user
  belongs_to :ability
  belongs_to :actor
  belongs_to :map

  validates :content, presence: true, length: { minimum: 1 }

  def quest_time_to_minutes
    self.set_seconds / 60
  end

  def minutes_seconds
    st = self.study_time
    m = st % 3600 / 60
    s = st % 60
    if m == 0
      s.to_s + "びょう"
    else
      m.to_s + "ふん " + s.to_s + "びょう"
    end
  end
end
