class Situation < ApplicationRecord
  belongs_to :actor
  has_many :animations, dependent: :destroy

  def have_animations(count)
    Animation.where(situation_id: self.id).first(count)
  end

end
