class Admin::DashboardController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :check_admin_verification!
  layout "admin_application"

  def index
    @news = News.new
    @news_index = News.all
  end
    
end
