class Admin::ActorsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @actors = Actor.page(params[:page]).per(6)
    @actor = Actor.new
  end

  def show
    @actor = Actor.find(params[:id])
    @situations = Situation.where(actor_id: @actor.id).page(params[:page]).per(6)
    @situation = Situation.new(actor_id: @actor.id)
  end

  def create
    actor = Actor.new(actor_params)
    if actor.save
      redirect_to admin_actor_path(actor), notice: "新規アクターを作成しました。"
    else
      render "index"
      @actors = Actor.page(params[:page]).per(6)
    end
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def update
    actor = Actor.find(params[:id])
    if actor.update(actor_params)
      redirect_to admin_actor_path(actor), notice: "情報の更新に成功しました。"
    else
      render "edit"
    end
  end

  def destroy
    actor = Actor.find(params[:id])
    actor.destroy
    redirect_to admin_actors_path, notice: "アクターを削除しました。"
  end

  private

  def actor_params
    params.require(:actor).permit(:name)
  end

end
