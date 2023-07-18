class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:attention]
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = current_user
    @abilities = Ability.where(user_id: @user.id)
  end

  def edit
    @user = current_user
    @actors = Actor.avatar
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to mypage_path, notice: "へんこうをほぞんしました。"
    else
      flash.now[:alert] = "へんこうのほぞんにしっぱいしました。"
      render :edit
    end
  end

  def attention
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "データをさくじょしました。"
  end

  private

  def user_params
    params.require(:user).permit(:actor_id, :name, :is_deleted)
  end

  def ensure_guest_user
    @user = current_user
    if @user.guest_user?
      redirect_to mypage_path, alert: "たいけんばんではじょうほうをへんこうできません。"
    end
  end
end
