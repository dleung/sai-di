class SearchesController < ApplicationController
  def index
    @search = Article.search(params[:search])
    if params[:tag_ids].blank?
      @articles = Article.published.search(params[:search]).order("created_at DESC").page(params[:page]).per(10)
    elsif params[:search].blank?
      @articles = Article.tagged_with(params[:tag_ids]).published.order("created_at DESC").page(params[:page]).per(10)
      @search_tags = params[:tag_ids]
    else
      @articles = Article.published.tagged_with(params[:tag_ids]).search(params[:search]).order("created_at DESC").page(params[:page]).per(10)
      @search_tags = params[:tag_ids]
    end
    unless params[:search].blank?
      @search_query = params[:search][:title_or_body_contains]
    end
    @all_tags = Article.tag_counts_on(:tags)
    render 'home/index'
  end

end
