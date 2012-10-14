class Admin::NewsController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :check_admin_verification!
  layout "admin_application"
  
  def create
    @news = News.create(params[:news])
    if @news.save!
      flash[:notice] = "News Created"
    else
      flash[:notice] = "News Not created"
    end
    redirect_to admin_path
  end
end
  
      
