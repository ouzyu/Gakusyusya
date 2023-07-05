class Admin::MapsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @maps = Map.page(params[:page]).per(2)
    @map = Map.new
  end

  def create
    map = Map.new(map_params)
    if map.save
      redirect_to admin_maps_path
    else
      render "index"
    end
  end

  def edit
    @map = Map.find(params[:id])
  end

  def update
    map = Map.find(params[:id])
    if map.update(map_params)
      redirect_to admin_maps_path, notice: "マップの更新に成功しました。"
    else
      render "edit"
    end
  end

  def destroy
    map = Map.find(params[:id])
    map.destroy
    redirect_to admin_maps_path, notice: "マップを削除しました。"
  end

  private

  def map_params
    params.require(:map).permit(:name, :image)
  end
end
