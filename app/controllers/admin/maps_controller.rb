class Admin::MapsController < ApplicationController
  before_action :authenticate_admin!

  def index
    
  end
  
  def create
  
  end
  
  def edit
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
  
  def map_params
    params.require(:map).permit(:name, :image)
  end
end
