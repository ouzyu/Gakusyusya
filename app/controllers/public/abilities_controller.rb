class Public::AbilitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @abilities = Ability.where(user_id: @user.id)
    @ability = Ability.new
  end

  def create
    @user = current_user
    @abilities = Ability.where(user_id: @user.id)
    ability = Ability.new(ability_params)
    ability.user_id = @user.id
    unless @abilities.count >= 7
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
