class Public::QuestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @quest = Quest.new
  end

  def index
    @user = current_user
    @quests = Quest.where(user_id: @user)
  end

  def show
    @quest = Quset.find(params[:id])
  end

  def create
    @user = current_user
    quest = Quest.new(quest_params)
    quest.user_id = @user.id
    if quest.save
      redirect_to adventures_start_path
    else
      flash.now[:alert] = "クエストのさくせいにしっぱいしました。"
      render "new"
    end
  end

  def edit
    @quest = Quest.find(params[:id])
  end

  def update
    quest = Quest.find(params[:id])
    if quest.update(quest_params)
      redirect_to quest_path(quest)
    else
      flash.now[:alert] = "クエストのへんこうにしっぱいしました。"
    end
  end

  def destroy
    quest = Quest.find(params[:id])
    quest.destroy
    redirect_to new_quest_path, "クエストをさくじょしました。"
  end

  private

  def quest_params
    params.require(:quest).permit(:user_id, :abilities_id, :actor_id, :map_id, :content, :seconds, :is_finished)
  end
end
