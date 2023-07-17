module ApplicationHelper

  def find_by_situation(actor_id, situation_name)
    Animation.find_by(situation_id: Situation.find_by(name: situation_name, actor_id: Actor.find(actor_id)).id)
  end

end
