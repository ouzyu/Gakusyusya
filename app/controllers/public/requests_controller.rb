class Public::RequestsController < ApplicationController

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.score = Language.get_data(request_params[:content])
    if @request.save
      redirect_to root_path, notice: "おといあわせをそうしんしました。"
    else
      flash.now[:alert] = "そうしんにしっぱいしました。"
      render "new"
    end
  end

  private

  def request_params
    params.require(:request).permit(:genre, :email, :content, :status)
  end

end
