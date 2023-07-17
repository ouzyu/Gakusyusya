class Public::AdventuresController < ApplicationController
  before_action :authenticate_user!

  def start
    @quest = Quest.find(params[:quest_id])
    @is_stoped = false
    @study_time = 0

    set_start_animations
    enemy_animation_sources

    incorrect_quest_path
  end

  def start_btn
    @quest = Quest.find(params[:quest_id])
    @quest.update(start_time: Time.now, study_time: 0)
    @study_time = @quest.study_time

    set_start_animations
    enemy_animation_sources
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

    set_start_animations
    enemy_animation_sources
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
    set_boss_animations
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

  def find_by_situation(actor_id, situation_name)
    Animation.find_by(situation_id: Situation.find_by(name: situation_name, actor_id: Actor.find(actor_id)).id)
  end

  def set_start_animations
    avatar = current_user.actor.id
    @avatar_standing = find_by_situation(avatar, "standing")
    @avatar_running = find_by_situation(avatar, "running")
    @avatar_attack = find_by_situation(avatar, "attack")
    @enemies = Actor.enemy.where(map_id: @quest.map_id)
    @avatar_source = url_for(@avatar_attack.image)
  end

  def set_boss_animations
    avatar = current_user.actor.id
    @avatar_standing = find_by_situation(avatar, "standing")
    @avatar_deathblow = find_by_situation(avatar, "deathblow")

    @boss_standing = find_by_situation(@quest.map.actors.boss.first.id, "standing")
    @boss_damaged = find_by_situation(@quest.map.actors.boss.first.id, "damaged")
  end

  def enemy_animation_sources
    @enemy_animation_sources = []
    @enemies.each do |enemy|
      source = url_for(find_by_situation(enemy.id, "damaged").image)
      @enemy_animation_sources.push(source)
    end
  end

end
