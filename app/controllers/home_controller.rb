class HomeController < ApplicationController
  def index
    @articles = Article.published.order("created_at DESC").page(params[:page]).per(10)
    @all_tags = Article.tag_counts_on(:tags)
    @search = Article.search(params[:search])
    @search_query = ""
    @news = News.all
  end

end
