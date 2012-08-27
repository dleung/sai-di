class ArticlesController < ApplicationController
  
  def show
    @article = Article.find(params[:id])
    session[:return_to] ||= request.referer
    unless admin_signed_in? || @article.published?
      redirect_to :back
    end
  end
end
