class Actor < ApplicationRecord
  has_many :situations, dependent: :destroy
  has_many :users, dependent: :destroy

  belongs_to :map, optional: true

  validates :name,    presence: true
  validate :check_map_id

  enum role: { avatar: 0, npc: 1, enemy: 2, boss: 3, effect: 4, gui: 5 }

  def have_first_animation
    situation = Situation.find_by(actor_id: self.id)
    if situation.present?
      Animation.find_by(situation_id: situation.id)
    end
  end

  def check_map_id
    if (self.role == "enemy" || self.role == "boss" ) && !self.map_id.present?
      errors.add :map_id, "　エネミーとボスはマップと関連付けてください。"
      return false
    elsif !(self.role == "enemy" || self.role == "boss" ) && self.map_id.present?
      errors.add :map_id, "　エネミーとボス以外はマップと関連付けないでください。"
      return false
    end
    return true
  end

end
