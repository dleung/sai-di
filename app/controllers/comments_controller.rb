class CommentsController < ApplicationController
  before_filter :authenticate_user!
  

  def create
    article = Article.find(params[:article_id])
    user = User.find(params[:article_id])
    comment = article.comments.build(params[:comment])
    comment.user = user
    if comment.save
      flash[:notice] = "Comment Added"
      redirect_to article_path(article)
    else      
      flash[:error] = 'You are missing information'
      @article = article
      render 'articles/show'
    end
  end
  
  
  def destroy
    comment = Comment.find(params[:id])
    comment.deleted = true
    if (current_user.id == comment.user_id) && comment.save
      flash[:notice] = "Comment Removed!"
    else
      flash[:notice] = "An Error Occured!"
    end
    redirect_to article_path(params[:article_id])
  end
end