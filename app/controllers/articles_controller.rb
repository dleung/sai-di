class ArticlesController < ApplicationController
  
  def show
    @article = Article.find(params[:id])
    session[:return_to_capykoa_article] = @article.id
    unless admin_signed_in? || @article.published?
      redirect_to :back
    end
  end
end
