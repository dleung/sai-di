class Admin::ArticlesController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :check_admin_verification!

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
end
