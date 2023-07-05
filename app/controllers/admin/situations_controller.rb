class Admin::SituationsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @situation = Situation.find(params[:id])
    @actor = Actor.find(@situation.actor_id)
    @animations = Animation.where(situation_id: @situation.id).page(params[:page]).per(6)
    @animation = Animation.new
  end

  def create
    situation = Situation.new(situation_params)
    if situation.save
      redirect_to admin_situation_path(situation), notice: "新規シチュエーションを作成しました"
    else
      render "admin/actors/show"
      @actor = Actor.find(situation.actor_id)
      @situations = Situation.where(actor_id: @actor.id).page(params[:page]).per(6)
      @situation = Situation.new(actor_id: @actor.id)
    end
  end

  def edit
    @situation = Situation.find(params[:id])
  end

  def update
    situation = Situation.find(params[:id])
    if situation.update(situation_params)
      redirect_to admin_situation_path(situation), notice: "情報の更新に成功しました。"
    else
      render "edit"
    end
  end

  def destroy
    situation = Situation.find(params[:id])
    actor = situation.actor_id
    situation.destroy
    redirect_to admin_actor_path(actor), notice: "シチュエーションを削除しました"
  end

  private

  def situation_params
    params.require(:situation).permit(:name, :actor_id)
  end

end
