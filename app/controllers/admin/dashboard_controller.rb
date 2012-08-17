class Admin::DashboardController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :check_admin_verification!

  def index
    redirect_to admin_articles_path
  end
    
end
