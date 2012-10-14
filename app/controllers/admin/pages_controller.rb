class Admin::PagesController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :check_admin_verification!
  layout "admin_application"

  def index
    @pages = Page.all
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    @page.update_attributes(params[:page])
    if @page.save
      flash[:notice] = "Article Saved!"
      redirect_to edit_admin_page_path(@page)
    else      
      flash[:error] = 'You are missing information'
      render 'edit'
    end
  end
end