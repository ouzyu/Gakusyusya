class Public::AdventuresController < ApplicationController
  before_action :authenticate_user!

  def start
    @quest = Quest.find(params[:quest_id])
    @is_stoped = false
    @stop_time = 0
    incorrect_quest_path
  end

  def start_btn
    @quest = Quest.find(params[:quest_id])
    @quest.update(start_time: Time.now)
    @stop_time = 0
  end

  def retire
    quest = Quest.find(params[:quest_id])
    user = quest.user

    quest.update(pause_time: Time.now)
    study_time = (quest.pause_time - quest.start_time).to_i
    sum_quest_study_time = quest.study_time + study_time
    sum_user_study_time = user.study_time + sum_quest_study_time
    quest.update(study_time: sum_quest_study_time)
    user.update(study_time: sum_user_study_time)

    redirect_to new_quest_path
  end

  def pause
    @quest = Quest.find(params[:quest_id])
    @quest.update(pause_time: Time.now)
    @is_stoped = true
  end

  def unpause
    @quest = Quest.find(params[:quest_id])
    @stop_time = (Time.now - @quest.pause_time).to_i
    @quest.update(start_time: Time.now)
    @is_stoped = false
  end

  def finish
    quest = Quest.find(params[:quest_id])
    # user = User.find(quest.user_id)
    # ability = Ability.find(quest.ability_id)

    # user.increment!(level: 1)
    # user.increment!(study_time: study_time)
    # ability.increment!(level: 1)
    # quest.update(is_finished: true)

    redirect_to adventures_boss_path(quest_id: quest.id)
  end

  def boss
    @quest = Quest.find(params[:quest_id])
    incorrect_quest_path
  end

  private

  def quest_params
    params.(:quest).permit(:user_id, :ability_id, :actor_id, :map_id, :content, :set_seconds, :start_time, :pause_time, :is_finished)
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
