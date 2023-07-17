class Public::AbilitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @abilities = Ability.where(user_id: @user.id)
    @ability = Ability.new
    # グラフ表示用
    @chart_abilities_name = Array.new
    @chart_abilities_level = Array.new
    @abilities.each do |ability|
      @chart_abilities_name << ability.name
      @chart_abilities_level << ability.level
    end
    @chart_max_level = @chart_abilities_level.max
  end

  def create
    @user = current_user
    @ability = Ability.new
    @abilities = Ability.where(user_id: @user.id)
    ability = Ability.new(ability_params)
    ability.user_id = @user.id
    unless @abilities.count >= 6
      if ability.save
        redirect_to abilities_path, notice: "あたらしいアビリティをついかしました。"
      else
        flash.now[:alert] = "アビリティのついかにしっぱいしました。"
        render "index"
      end
    else
      flash.now[:alert] = "アビリティは６つまでしかとうろくできません。"
      render "index"
    end
  end

  def edit
    @ability = Ability.find(params[:id])
  end

  def update
    @ability = Ability.find(params[:id])
    if @ability.update(ability_params)
      redirect_to abilities_path, notice: "アビリティのなまえをへんこうしました。"
    else
      flash.now[:alert] = "なまえのへんこうにしっぱいしました。"
      render "edit"
    end
  end

  def destroy
    ability = Ability.find(params[:id])
    ability.destroy
    redirect_to abilities_path, notice: "アビリティをさくじょしました。"
  end

  private

  def ability_params
    params.require(:ability).permit(:name)
  end
end
