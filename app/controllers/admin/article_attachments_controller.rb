class Admin::ArticleAttachmentsController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :check_admin_verification!
  
  def create
    @article = Article.find(params[:article_id])
    @article_attachment = @article.article_attachments.build(params[:article_attachment])
    unless @article.save
      flash[:error] = 'Attachment could not be uploaded'
    end
    redirect_to edit_admin_article_path(@article)
  end

  def destroy
    @article_attachment = ArticleAttachment.find(params[:id])
    @article = @article_attachment.article
    if @article_attachment.destroy
      flash[:notice] = 'File Removed'
    else
      flash[:error] = 'Photo could not be deleted'
    end
    redirect_to edit_admin_article_path(@article)
  end

end