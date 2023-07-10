class Public::AdventuresController < ApplicationController
  before_action :authenticate_user!

  def start
    @quest = Quest.find(params[:quest_id])
    incorrect_quest_path
  end

  def boss
    @quest = Quest.find(params[:quest_id])
    incorrect_quest_path
  end

  def finish
    quest = Quest.find(params[:quest_id])
    user = User.find(quest.user_id)
    ability = Ability.find(quest.ability_id)

    user.increment!(:level, 1)
    user.increment!(:study_time, quest.seconds)
    ability.increment!(:level, 1)
    quest.update(:is_finished, true)

    redirect_to new_quest_path
  end

  private

  def quest_params
    params.(:quest).permit(:user_id, :ability_id, :actor_id, :map_id, :content, :seconds, :is_finished)
  end

  def incorrect_quest_path
    unless @quest.user_id == current_user.id
      redirect_to new_quest_path
    end

    if @quest.is_finished == true
      redirect_to new_quest_path
    end
  end
end
