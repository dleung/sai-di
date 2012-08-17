class Admin::AdminsController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :check_admin_verification!
  
  def index
    @admins = Admin.all
  end
    
end
