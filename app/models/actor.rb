class Actor < ApplicationRecord
  has_many :situations, dependent: :destroy
  has_many :users, dependent: :destroy

  belongs_to :map, optional: true

  def have_first_animation
    situation = Situation.find_by(actor_id: self.id)
    if situation.present?
      Animation.find_by(situation_id: situation.id)
    end
  end

end
