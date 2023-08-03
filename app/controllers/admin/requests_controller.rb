class Admin::RequestsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @requests = Request.page(params[:page]).per(10)
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

  private

  def request_params
    params.require(:request).permit(:genre, :email, :content, :status)
  end

end
