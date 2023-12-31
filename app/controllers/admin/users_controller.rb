class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "情報の更新に成功しました。"
    else
      flash.now[:alert] = "情報の更新に失敗しました。"
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:actor_id, :name, :email, :level, :study_time, :is_deleted)
  end

end
