class DemoLoginController < ApplicationController
  def sign_in
    sign_out(current_user) if current_user
    session[:demo_access] = false  
    render layout: false
  end
  
  def log_in
    if params[:Account] == "demo" and params[:Password] == "demo123"
      session[:demo_access] = true
      redirect_to root_path
    else
      redirect_to "/demo_login", notice: "Wrong account or password entered"
    end
  end
end
