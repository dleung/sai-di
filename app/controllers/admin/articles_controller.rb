class Admin::ArticlesController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :check_admin_verification!

  def index
    @articles = Article.all
  end

  def new
    article = Article.create!(author_id: current_admin.id)
    redirect_to edit_admin_article_path(article.id)
  end

  def tags 
    query = params[:q]
    if query[-1,1] == " "
      query = query.gsub(" ", "")
      ActsAsTaggableOn::Tag.find_or_create_by_name(query)
    end

    #Do the search in memory for better performance

    @tags = ActsAsTaggableOn::Tag.all
    @tags = @tags.select { |v| v.name =~ /#{query}/i }
    respond_to do |format|
      format.json { render :json => @tags.collect{|t| {:id => t.name, :name => t.name }}}
    end
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    if @article.save
      @article.check_and_encode_address
      flash[:notice] = "Article Saved!"
      redirect_to edit_admin_article_path(@article)
    else      
      flash[:error] = 'You are missing information'
      render 'edit'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = "Article Deleted!"
    else
      flash[:notice] = "An Error Occured!"
    end
    redirect_to admin_articles_path
  end
end
