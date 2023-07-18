class Public::HomesController < ApplicationController
  def top
  end

  def about
    @shalica = Actor.find_by(role: "npc")
    @shalica_standing = Animation.find_by(situation_id: Situation.find_by(name: "standing", actor_id: @shalica.id))
  end
end
