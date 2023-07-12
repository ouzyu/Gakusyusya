class Actor < ApplicationRecord
  has_many :situations, dependent: :destroy
  has_many :users, dependent: :destroy

  belongs_to :map, optional: true

  validates :name,    presence: true
  validates :map_id,  presence: true, if: :role == "enemy" || :role == "boss", on: :update

  enum role: { avatar: 0, npc: 1, enemy: 2, boss: 3, effect: 4, gui: 5 }

  def have_first_animation
    situation = Situation.find_by(actor_id: self.id)
    if situation.present?
      Animation.find_by(situation_id: situation.id)
    end
  end

end
