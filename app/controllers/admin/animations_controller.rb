class Admin::AnimationsController < ApplicationController
  before_action :authenticate_admin!

  def create
    animation = Animation.new(animation_params)
    situation = animation.situation_id
    if animation.save
      redirect_to admin_situation_path(situation)
    else
      render "admin/situations/show"
      @situation = Situation.find(animation.situation_id)
      @actor = Actor.find(@situation.actor_id)
      @animations = Animation.where(situation_id: @situation.id).page(params[:page]).per(6)
      @animation = Animation.new
    end
  end

  def edit
    @animation = Animation.find(params[:id])
  end

  def update
    animation = Animation.find(params[:id])
    situation = animation.situation_id
    if animation.update(animation_params)
      redirect_to admin_situation_path(situation), notice: "アニメーションの更新に成功しました。"
    else
      render "edit"
    end
  end

  def destroy
    animation = Animation.find(params[:id])
    situation = animation.situation_id
    animation.destroy
    redirect_to admin_situation_path(situation), notice: "アニメーションを削除しました。"
  end

  private

  def animation_params
    params.require(:animation).permit(:image, :situation_id)
  end
end
