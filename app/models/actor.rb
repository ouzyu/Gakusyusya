class Actor < ApplicationRecord
  has_many :situations, dependent: :destroy
  has_many :users, dependent: :destroy

  def have_first_animation
    situation = Situation.find_by(actor_id: self.id)
    Animation.find_by(situation_id: situation.id)
  end

end
