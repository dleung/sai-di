class HomeController < ApplicationController
  def index
    @articles = Article.published.order("created_at DESC").page(params[:page]).per(10)
    @all_tags = Article.tag_counts_on(:tags)
  end

  def food
    @articles = Article.tagged_with("food").published.order("created_at DESC").page(params[:page]).per(10)
    @all_tags = Article.tag_counts_on(:tags)    
    render 'index'
  end
  
  def programming
    @articles = Article.tagged_with("programming").published.order("created_at DESC").page(params[:page]).per(10)
    @all_tags = Article.tag_counts_on(:tags)
    render 'index'
  end

end
