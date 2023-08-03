class Admin::RequestsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @requests = Request.latest.page(params[:page]).per(10)
    @sort_by = "新しい順"
  end

  def show
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to admin_requests_path, notice: "問い合わせ状況を更新しました。"
    else
      flash.now[:alert] = "更新に失敗しました。"
      render "show"
    end
  end

  def sort_by
    if params[:sort_by] == "latest"
      @requests = Request.latest.page(params[:page]).per(10)
      @sort_by = "新しい順"
    elsif params[:sort_by] == "old"
      @requests = Request.old.page(params[:page]).per(10)
      @sort_by = "古い順"
    elsif params[:sort_by] == "claim"
      @requests = Request.where(genre: "claim").page(params[:page]).per(10)
      @sort_by = "問い合わせ"
    elsif params[:sort_by] == "impression"
      @requests = Request.where(genre: "impression").page(params[:page]).per(10)
      @sort_by = "感想"
    elsif params[:sort_by] == "new_attack"
      @requests = Request.where(genre: "new_attack").page(params[:page]).per(10)
      @sort_by = "新しい攻撃"
    elsif params[:sort_by] == "new_deathblow"
      @requests = Request.where(genre: "new_deathblow").page(params[:page]).per(10)
      @sort_by = "新しい必殺技"
    elsif params[:sort_by] == "new_enemy"
      @requests = Request.where(genre: "new_enemy").page(params[:page]).per(10)
      @sort_by = "新しいエネミー"
    elsif params[:sort_by] == "new_boss"
      @requests = Request.where(genre: "new_boss").page(params[:page]).per(10)
      @sort_by = "新しいボス"
    elsif params[:sort_by] == "new_map"
      @requests = Request.where(genre: "new_map").page(params[:page]).per(10)
      @sort_by = "新しいマップ"
    elsif params[:sort_by] == "many_score"
      @requests = Request.many_score.page(params[:page]).per(10)
      @sort_by = "スコアの多い順"
    elsif params[:sort_by] == "few_score"
      @requests = Request.few_score.page(params[:page]).per(10)
      @sort_by = "スコアの少ない順"
    elsif params[:sort_by] == "not_checked"
      @requests = Request.where(status: "not_checked").page(params[:page]).per(10)
      @sort_by = "未確認"
    elsif params[:sort_by] == "responding"
      @requests = Request.where(status: "responding").page(params[:page]).per(10)
      @sort_by = "対応中"
    elsif params[:sort_by] == "responded"
      @requests = Request.where(status: "responded").page(params[:page]).per(10)
      @sort_by = "対応済み"
    else
      @requests = Request.all.page(params[:page]).per(10)
      @sort_by = "新しい順"
    end
  end

  private

  def request_params
    params.require(:request).permit(:genre, :email, :content, :status)
  end

end
