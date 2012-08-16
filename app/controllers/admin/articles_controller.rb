class Admin::ArticlesController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :check_admin_verification!

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save!
      flash[:notice] = "Article Saved!"
      redirect_to admin_article_path(@article)
    else
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
end
