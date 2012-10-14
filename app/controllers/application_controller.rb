class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :demo_login if Rails.configuration.demo_mode
  
  def demo_login
    redirect_to "/coming_soon" unless controller_name == "coming_soon" or session[:demo_access]
  end
  
  def after_sign_out_path_for(resource_name)
    root_path
  end

  def after_sign_in_path_for(resource_name)
    if resource_name.is_a? Admin
      admin_path
    elsif resource_name.is_a? User
      if session[:return_to_capykoa_article].blank?
        root_path
      else
        article_path(Article.find(session[:return_to_capykoa_article]))
      end
    end
  end

  def check_admin_verification!
    unless current_admin.manual_verified?
      flash[:notice] = "You are not verified.  Please contact davleun@gmail.com for support."
      redirect_to root_path
    end
  end

end
