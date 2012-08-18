class SearchesController < ApplicationController
  def index
    conditions = <<-EOS
      to_tsvector('english', body) @@ plainto_tsquery('english', ?)
    EOS
    @search_params = params[:q].to_s
    if params[:tag_ids].blank?
      @articles = Article.published.where(conditions, params[:q]).order("created_at DESC").page(params[:page]).per(10)
    elsif params[:q].blank?
      @articles = Article.tagged_with(params[:tag_ids]).published.order("created_at DESC").page(params[:page]).per(10)
      @search_tags = params[:tag_ids]
    else
      @articles = Article.tagged_with(params[:tag_ids]).published.where(conditions, params[:q]).order("created_at DESC").page(params[:page]).per(10)
      @search_tags = params[:tag_ids]
    end
    @search_query = params[:q]
    @all_tags = Article.tag_counts_on(:tags)
    render 'home/index'
  end

end
