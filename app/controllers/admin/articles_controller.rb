class Admin::ArticlesController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :check_admin_verification!

  def index
    @articles = Article.all
  end

  def new
    article = Article.create!
    redirect_to edit_admin_article_path(article.id)
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])

    if @article.save
      flash[:notice] = "Article Saved!"
      redirect_to edit_admin_article_path(@article)
    else      
      flash[:error] = 'Attachment could not be uploaded'
      render 'edit'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
end
