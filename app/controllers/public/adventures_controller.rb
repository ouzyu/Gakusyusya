class Public::AdventuresController < ApplicationController
  before_action :authenticate_user!

  def start
    @quest = Quest.find(params[:quest_id])
    @is_stoped = false
    @study_time = 0
    @avatar_standing_animation = Animation.find_by(situation_id: Situation.find_by(name: "standing", actor_id: Actor.find(@quest.user.actor.id)).id)
    @enemy = @quest.map.actors.enemy.first
    incorrect_quest_path
  end

  def start_btn
    @quest = Quest.find(params[:quest_id])
    @quest.update(start_time: Time.now, study_time: 0)
    @study_time = @quest.study_time
  end

  def retire
    quest = Quest.find(params[:quest_id])
    user = quest.user

    quest.update(study_time: (Time.now - quest.start_time).to_i + quest.study_time)
    user.update(study_time: user.study_time + quest.study_time)

    redirect_to new_quest_path
  end

  def pause
    @quest = Quest.find(params[:quest_id])
    @quest.update(study_time: (Time.now - @quest.start_time).to_i + @quest.study_time)
    @is_stoped = true
  end

  def unpause
    @quest = Quest.find(params[:quest_id])
    @quest.update(start_time: Time.now)
    @study_time = @quest.study_time
    @is_stoped = false
  end

  def finish
    quest = Quest.find(params[:quest_id])
    user = quest.user
    ability = quest.ability
    study_time = (Time.now - quest.start_time).to_i + quest.study_time
    if study_time < quest.set_seconds
      quest.update(study_time: study_time)
    else
      quest.update(study_time: quest.set_seconds)
    end
    user.update(study_time: user.study_time + study_time, level: user.level + 1)
    ability.update(level: ability.level + 1)
    quest.update(is_finished: true)

    redirect_to adventures_boss_path(quest_id: quest.id)
  end

  def boss
    @quest = Quest.find(params[:quest_id])
  end

  private

  def quest_params
    params.(:quest).permit(:user_id, :ability_id, :actor_id, :map_id, :content, :set_seconds, :start_time, :is_finished)
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
