class Public::QuestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @quest = Quest.new
    @quests = Quest.where(user_id: @user).order(created_at: :desc).limit(6)
    if @quests.blank?
      @show_box_exist = false
    else
      @show_box_exist = true
    end
    @shalica = Actor.find_by(name: "シャリカ")
    @actors = Actor.boss
    @maps = Map.all
    @abilities = Ability.where(user_id: @user.id)
    if @abilities.blank?
      redirect_to abilities_path, flash: { alert: "アビリティのとうろくをしなければ、クエストをうけることはできません。" }
    end
  end

  def create
    @user = current_user
    @quest = Quest.new(quest_params)
    @quest.user_id = @user.id
    @quest.start_time = Time.now
    if @quest.save
      redirect_to adventures_start_path(quest_id: @quest.id)
    else
      @quests = Quest.where(user_id: @user)
      @shalica = Actor.find_by(name: "シャリカ")
      @actors = Actor.boss
      @maps = Map.all
      @abilities = Ability.where(user_id: @user.id)
      if @quests.blank?
        @show_box_exist = false
      else
        @show_box_exist = true
      end
      flash.now[:alert] = "クエストのさくせいにしっぱいしました。"
      render "new"
    end
  end

  private

  def quest_params
    params.require(:quest).permit(:user_id, :ability_id, :actor_id, :map_id, :content, :set_seconds, :is_finished)
  end
end
