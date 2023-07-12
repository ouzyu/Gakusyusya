class Public::QuestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @quest = Quest.new
    @quests = Quest.where(user_id: @user).order(created_at: :desc).limit(6)
    @shalica = Actor.find_by(name: "シャリカ")
  end

  def index
    @user = current_user
    @quests = Quest.where(user_id: @user)
  end

  def create
    @user = current_user
    quest = Quest.new(quest_params)
    quest.user_id = @user.id
    quest.start_time = Time.now
    if quest.save
      redirect_to adventures_start_path(quest_id: quest.id)
    else
      @quest = Quest.new
      @quests = Quest.where(user_id: @user)
      @shalica = Actor.find_by(name: "シャリカ")
      flash.now[:alert] = "クエストのさくせいにしっぱいしました。"
      render "new"
    end
  end

  private

  def quest_params
    params.require(:quest).permit(:user_id, :ability_id, :actor_id, :map_id, :content, :seconds, :is_finished)
  end
end
