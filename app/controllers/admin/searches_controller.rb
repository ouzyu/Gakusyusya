class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @word = params[:word]
    @requests = Request.where("email LIKE?", "%#{@word}%").page(params[:page]).per(10)
  end

end
